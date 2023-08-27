import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hire_knock/api_services/onboard_api_service.dart';
import 'package:hire_knock/app_constants/app_snackbar.dart';
import 'package:hire_knock/app_route/app_router.gr.dart';
import 'package:hire_knock/app_services/navigator_service.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:hire_knock/models/country_code/country_code.dart';
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
  final phoneController = TextEditingController();

  Rx<CountryCode?> selectedCountry = Rx<CountryCode?>(null);
  RxList<CountryCode> countries = RxList<CountryCode>();

  bool isValidated() {
    if (!isLogin.value && nameController.text.length < 4) {
      AppSnackbar.error('Please enter name');
      return false;
    }

    if (!emailController.text.isEmail) {
      AppSnackbar.error('Please enter email');
      return false;
    }

    if (passwordController.text.isEmpty) {
      AppSnackbar.error('Please enter password');
      return false;
    }

    if (!isLogin.value && !isConfirmed.value) {
      AppSnackbar.error('Please confirm');
      return false;
    }

    return true;
  }

  Future<void> loginOrRegister() async {
    if (isLogin.value) {
      UserData? user = await OnboardApiService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (user != null) {
        _userController.selectUser(user);
      }
    } else {
      NavigatorService.push(SecurityCheckScreen());
    }
  }

  Future<void> securityCheckSubmit() async {
    UserData? user = await OnboardApiService.signup(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fullName: nameController.text.trim(),
      mobileNo: phoneController.text.trim(),
      linkedinUrl: '',
    );
    if (user != null) {
      _userController.selectUser(user);
      NavigatorService.replaceAll([HomeScreen()]);
    }
  }

  String getPhoneNumber() {
    String dialCode = selectedCountry.value?.dialCode ?? '';
    String phone = phoneController.text.trim();
    return dialCode + phone;
  }

  Future<void> forgotPassword() async {}

  Future<void> fetchCountryCodes() async {
    final jsonString =
        await rootBundle.loadString('assets/json/country_code.json');
    List<dynamic> jsonList = json.decode(jsonString);
    countries.value = jsonList.map((jsonData) {
      return CountryCode(
        name: jsonData['name'],
        dialCode: jsonData['dial_code'],
        countryCode: jsonData['code'],
        flag: jsonData['emoji'],
      );
    }).toList();
  }
}
