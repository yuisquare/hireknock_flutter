import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HLinkButton extends StatelessWidget {
  const HLinkButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: HText(
        text: text,
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        // fontStyle: FontStyle.italic,
      ),
    );
  }
}
