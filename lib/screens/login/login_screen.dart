// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_knock/core/app_constants/app_colors.dart';
import 'package:hire_knock/core/app_constants/app_images.dart';
import 'package:hire_knock/controllers/auth_controller/auth_controller.dart';
import 'package:hire_knock/controllers/login_controller/login_controller.dart';
import 'package:hire_knock/utils/utils.dart';
import 'package:hire_knock/widgets/button/h_button.dart';
import 'package:hire_knock/widgets/button/h_link_button.dart';
import 'package:hire_knock/widgets/checkbox/h_checkbox.dart';
import 'package:hire_knock/widgets/container/h_container.dart';
import 'package:hire_knock/widgets/image/h_image.dart';
import 'package:hire_knock/widgets/input/h_input_text_field.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';
import 'package:auto_route/auto_route.dart';

final _authController = Get.put(AuthController());

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildViewPanel(),
      ),
    );
  }

  Widget _buildViewPanel() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HSpace.vertical(10),
          const HText(
            text: 'Get Started',
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          HText(
            text: 'Create or login to your account, your data is save',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade400,
          ),
          HSpace.vertical(30),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildToggleTextWithUnderLine(),
                  HSpace.vertical(20),
                  Obx(() {
                    if (controller.isLogin.value) return const Offstage();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: HInputTextField(
                        hintText: 'Name',
                        controller: controller.nameController,
                      ),
                    );
                  }),
                  HInputTextField(
                    hintText: 'Email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  HSpace.vertical(20),
                  Obx(() {
                    return HInputTextField(
                      hintText: 'Password',
                      controller: controller.passwordController,
                      obscureText: controller.hidePassword.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.hidePassword.toggle();
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 18,
                          color: controller.hidePassword.value
                              ? Colors.grey.shade500
                              : AppColor.primary,
                        ),
                      ),
                    );
                  }),
                  HSpace.vertical(20),
                  Obx(() {
                    if (controller.isLogin.value) return const Offstage();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: HCheckbox(
                        value: controller.isConfirmed.value,
                        label:
                            'I confirm that I am of legal age, I have read and agree to the Service agreement.',
                        onChecked: (value) {
                          controller.isConfirmed.value = value ?? false;
                        },
                      ),
                    );
                  }),
                  Obx(() {
                    return HButton(
                      onPress: () {
                        if (!controller.isValidated()) return;
                        controller.loginOrRegister();
                      },
                      text: controller.isLogin.value ? 'Login' : 'Register',
                      width: double.infinity,
                      height: 45,
                    );
                  }),
                  HSpace.vertical(20),
                  Row(
                    children: [
                      _buildDivider(),
                      HSpace.horizonital(10),
                      Obx(() {
                        return HText(
                          text:
                              'or ${controller.isLogin.value ? 'login' : 'register'} with',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        );
                      }),
                      HSpace.horizonital(10),
                      _buildDivider(),
                    ],
                  ),
                  HSpace.vertical(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLoginWithOther(
                        LoginType.google,
                        AppImage.googleIcon,
                      ),
                      // if (Platform.isIOS)
                      _buildLoginWithOther(
                        LoginType.apple,
                        AppImage.appleIcon,
                      ),
                      _buildLoginWithOther(
                        LoginType.facebook,
                        AppImage.facebookIcon,
                      ),
                    ],
                  ),
                  Obx(() {
                    if (!controller.isLogin.value) return const Offstage();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: HLinkButton(
                        onPressed: controller.forgotPassword,
                        text: 'Forgot Password ?',
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildToggleTextWithUnderLine() {
    return Obx(() {
      return Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              _buildToggleText(
                text: 'Login',
                isSelected: controller.isLogin.value,
              ),
              _buildToggleText(
                text: 'Register',
                isSelected: !controller.isLogin.value,
              ),
              const Offstage(),
            ],
          ),
          TableRow(
            children: [
              Divider(
                thickness: controller.isLogin.value ? 2 : 1,
                color: Colors.black,
              ),
              Divider(
                thickness: !controller.isLogin.value ? 2 : 1,
                color: Colors.black,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildLoginWithOther(LoginType loginType, String path) {
    return InkWell(
      onTap: () async {
        await _authController.login(loginType);
      },
      child: HContainer(
        shape: BoxShape.circle,
        padding: const EdgeInsets.all(10),
        width: 56,
        height: 56,
        color: AppColor.fieldColor,
        child: HImage(
          imageType: ImageType.asset,
          path: AppImage.baseUrlIcons + path,
          height: 16,
          width: 16,
        ),
      ),
    );
  }

  Widget _buildToggleText({
    required String text,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        Utils.hideKeyboard();
        controller.isLogin.value = text == 'Login';
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: HText(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.black : Colors.grey.shade500,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Expanded(
      child: Divider(
        color: Colors.black,
      ),
    );
  }
}
