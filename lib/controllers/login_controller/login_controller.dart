import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_knock/api_services/onboard_api_service.dart';
import 'package:hire_knock/app_constants/app_snackbar.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:hire_knock/models/user_data/user_data.dart';

class LoginController extends GetxController {
  final _userController = Get.put(UserAccountController());

  RxBool showLoader = RxBool(false);
  RxBool isLogin = RxBool(true);
  RxBool hidePassword = RxBool(true);
  RxBool isConfirmed = RxBool(false);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isValidated() {
    if (!isLogin.value && nameController.text.length < 4) return false;

    if (!emailController.text.isEmail) return false;

    if (passwordController.text.isEmpty) return false;

    if (!isLogin.value && !isConfirmed.value) return false;

    return true;
  }

  Future<void> loginOrRegister() async {
    UserData? user;
    if (isLogin.value) {
      user = await OnboardApiService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      AppSnackbar.success('Login successful');
    } else {
      user = await OnboardApiService.signup(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fullName: nameController.text.trim(),
        mobileNo: '',
        linkedinUrl: '',
      );
      AppSnackbar.success('Signup successful');
    }
    if (user != null) {
      _userController.selectUser(user);
    }
  }

  Future<void> forgotPassword() async {}
}
