import 'package:flutter/material.dart';
import 'package:hire_knock/core/app_constants/app_colors.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HLinkButton extends StatelessWidget {
  const HLinkButton({super.key, required this.onPressed, required this.text});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: HText(
        text: text,
        color: AppColor.buttonBlue,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
