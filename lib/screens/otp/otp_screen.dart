import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_knock/controllers/otp_controller/otp_controller.dart';
import 'package:hire_knock/widgets/button/h_button.dart';
import 'package:hire_knock/widgets/button/h_link_button.dart';
import 'package:hire_knock/widgets/input/h_input_text_field.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.onSubmit,
  });

  final Function() onSubmit;
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  final controller = Get.put(OtpController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      controller.sendOtp(phone: widget.phoneNumber);
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
            text: 'Verification',
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          HText(
            text:
                'To finish registration, please enter the verification code we gave you.',
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
                  HInputTextField(
                    hintText: '',
                    controller: otpController,
                    keyboardType: TextInputType.phone,
                  ),
                  HSpace.vertical(20),
                  HButton(
                    onPress: () =>
                        controller.verifyOtp(onSubmit: widget.onSubmit),
                    text: 'Submit',
                    width: double.infinity,
                    height: 45,
                  ),
                  HSpace.vertical(20),
                  const HText(
                    text: "Didn't receive the code?",
                    color: Colors.black,
                  ),
                  HLinkButton(
                    onPressed:()=> controller.sendOtp(phone: widget.phoneNumber),
                    text: 'Resend code by SMS',
                  ),
                  HLinkButton(
                    onPressed:()=> controller.sendOtpByPhoneCall(phone: widget.phoneNumber),
                    text: 'Resend code by Phone Call',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
