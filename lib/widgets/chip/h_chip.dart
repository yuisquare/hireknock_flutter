import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/container/h_container.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  const HChip(
      {super.key,
      required this.text,
      required this.backgroundColor,
      this.textColor = Colors.white,
      this.borderColor = Colors.black,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return HContainer(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      color: backgroundColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(5),
      child: HText(
        text: text,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
