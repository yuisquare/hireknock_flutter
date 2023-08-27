// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_knock/app_route/app_router.gr.dart';
import 'package:hire_knock/app_services/navigator_service.dart';
import 'package:hire_knock/controllers/login_controller/login_controller.dart';
import 'package:hire_knock/models/country_code/country_code.dart';
import 'package:hire_knock/widgets/button/h_button.dart';
import 'package:hire_knock/widgets/button/h_link_button.dart';
import 'package:hire_knock/widgets/input/h_input_dropdown_field.dart';
import 'package:hire_knock/widgets/input/h_input_text_field.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class SecurityCheckScreen extends StatefulWidget {
  const SecurityCheckScreen({Key? key}) : super(key: key);

  @override
  State<SecurityCheckScreen> createState() => _SecurityCheckScreenState();
}

class _SecurityCheckScreenState extends State<SecurityCheckScreen> {
  final controller = Get.put(LoginController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await controller.fetchCountryCodes();
    });
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
            text: 'Security Check',
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          HText(
            text:
                'As an extra security step, we’ll need to give you a verification code to register. ',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade400,
          ),
          HLinkButton(
            onPressed: () {},
            text: 'Learn more',
          ),
          HSpace.vertical(30),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Obx(() {
                    return HInputDropdownField<CountryCode>(
                      hintText: 'Select Country',
                      onChanged: (value) {
                        controller.selectedCountry.value = value;
                      },
                      items:
                          List.generate(controller.countries.length, (index) {
                        CountryCode? item = controller.countries[index];
                        return DropdownMenuItem(
                          value: item,
                          child: HText(
                            text:
                                '${item.flag ?? ''}  ${item.name ?? ''} (${item.dialCode ?? ''})',
                            color: Colors.black,
                          ),
                        );
                      }),
                    );
                  }),
                  HSpace.vertical(20),
                  HInputTextField(
                    hintText: 'Phone Number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  HSpace.vertical(20),
                  HButton(
                    onPress: () {
                      NavigatorService.push(OtpScreen(
                        phoneNumber: controller.getPhoneNumber(),
                        onSubmit: controller.securityCheckSubmit,
                      ));
                    },
                    text: 'Submit',
                    width: double.infinity,
                    height: 45,
                  ),
                  HSpace.vertical(20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
