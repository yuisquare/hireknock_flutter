import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hire_knock/api_services/user_api_service.dart';
import 'package:hire_knock/app_services/version_service.dart';
import 'package:hire_knock/models/user_data/user_data.dart';
import 'package:hire_knock/app_constants/app_colors.dart';
import 'package:hire_knock/app_constants/app_loader.dart';
import 'package:hire_knock/app_constants/app_snackbar.dart';
import 'package:hire_knock/app_constants/app_storage.dart';
import 'package:hire_knock/app_route/app_router.gr.dart';
import 'package:hire_knock/app_services/navigator_service.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:hire_knock/utils/logger.dart';
import 'package:hire_knock/widgets/dialogs/h_dialog.dart';
import 'package:hire_knock/widgets/text/h_text.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum LoginType {
  google,
  apple,
  facebook,
  emailPassword,
}

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FacebookAuth facebookAuth = FacebookAuth.instance;
  GoogleSignIn googleSign = GoogleSignIn();
  final _userAccountController = Get.put(UserAccountController());

  Future<void> login(LoginType loginType) async {
    bool isLoggedIn = false;
    switch (loginType) {
      case LoginType.google:
        isLoggedIn = await loginWithGoogle();
        break;
      case LoginType.apple:
        print('Login with apple');
        break;
      case LoginType.facebook:
        isLoggedIn = await loginWithFacebook();
        break;
      case LoginType.emailPassword:
        print('Login with email password');
        break;
    }
    if (isLoggedIn) {
      // NavigatorService.push(InstitutesScreen());
    } else {
      AppSnackbar.show(message: 'Login failed', snackType: SnackType.error);
    }
  }

  Future<bool> loginWithFacebook() async {
    // var data = await facebookAuth.getUserData();
    // print(data);
    final LoginResult loginResult = await facebookAuth.login(
      permissions: ['email', 'public_profile'],
    );

    if (loginResult.accessToken == null) return false;
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    var credential =
        await firebaseAuth.signInWithCredential(facebookAuthCredential);
    print(credential.user?.uid);
    return false;
  }

  Future<UserData?> _getUserData(String id) async {
    UserData? userData = await UserApiService.fetchUserData(userId: id);
    if (userData == null) return null;
    AppStorage.saveData(key: 'userData', data: jsonEncode(userData));
    return userData;
  }

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignInAccount? account = await googleSign.signIn();
      if (account == null) {
        return false;
      } else {
        GoogleSignInAuthentication authentication =
            await account.authentication;
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
        UserCredential result =
            await firebaseAuth.signInWithCredential(oAuthCredential);
        var userAccount = result.user;
        if (userAccount != null) {
          UserData? teacherData = await _getUserData(userAccount.uid);
          if (teacherData != null && teacherData.uid != null) {
            _userAccountController.userData.value = teacherData;
            return true;
          } else {
            UserData userData = UserData(
              name: userAccount.displayName,
              email: userAccount.email,
              uid: userAccount.uid,
              photoUrl: userAccount.photoURL,
            );
            AppStorage.saveData(key: 'userData', data: jsonEncode(userData));
            // NavigatorService.replace(SignupScreen());
          }
        }
      }
    } on Exception catch (e) {
      Logger.error('Login error: $e');
      return false;
    }
    return false;
  }

  bool isLoggedIn({bool isFirebase = false}) {
    if (isFirebase) {
      if (firebaseAuth.currentUser != null) return true;
    } else {
      var userData = AppStorage.getData('userData');
      if (userData != null && userData.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<void> signOut() async {
    AppLoader.show(title: 'Logout in progress');
    await googleSign.signOut();
    await firebaseAuth.signOut();
    AppStorage.removeData(key: 'userData');
    AppStorage.removeData(key: 'selectedRole');
    _userAccountController.userData.value = null;
    AppLoader.close();
    NavigatorService.replace(const LoginScreen());
  }

//force update
  Future<bool> checkForUpdate() async {
    Logger.info('versionControl:');
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int currBuildNumber = int.parse(packageInfo.buildNumber);
    VersionService versionService = VersionService();
    Map<String, dynamic>? latestVersion = await versionService.getVersion();
    if (latestVersion != null) {
      String? forcedMessage = latestVersion['message'];
      if (currBuildNumber < latestVersion['buildNumber']) {
        updateDialogue(
          isForced: latestVersion['isForced'],
          forcedMessage: forcedMessage ?? '',
        );
        return true;
      }
    }
    return false;
  }

  void updateDialogue({bool isForced = false, required String forcedMessage}) =>
      HDialog.show(
        title: 'Update Available',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HText(
            text: forcedMessage,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          isForced
              ? const Offstage()
              : TextButton(
                  onPressed: Get.back,
                  child: const HText(
                    text: 'Cancel',
                    color: Colors.black,
                  ),
                ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColor.accentColor,
              ),
            ),
            child: const HText(
              text: 'Update',
              color: Colors.black,
            ),
            onPressed: () async {
              // String _url = "http://onelink.to/quizole";
              // await canLaunch(_url)
              //     ? await launch(_url)
              //     : throw 'Could not launch $_url';
              // await Restart.restartApp();
              // html.window.location.reload();
            },
          ),
        ],
        barrierDismissible: !isForced,
        // onWillPop: () async => !isForced,
      );
}
