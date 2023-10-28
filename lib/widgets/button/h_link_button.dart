import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HLinkButton extends StatelessWidget {
  const HLinkButton({super.key, required this.onPressed, required this.text});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: HText(
        text: text,
        color: Colors.blue,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        // fontStyle: FontStyle.italic,
      ),
    );
  }
}
