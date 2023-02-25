import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool showLoader = RxBool(false);
  RxBool isLogin = RxBool(true);
  RxBool hidePassword = RxBool(true);
  RxBool isVerified = RxBool(false);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isValidated() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (!isLogin.value && nameController.text.length < 4) return false;

    if (!emailValid) return false;

    if (passwordController.text.isEmpty) return false;

    if (!isLogin.value && !isVerified.value) return false;

    return true;
  }

  Future<void> loginOrRegister() async {}
  Future<void> forgotPassword() async {}
}
