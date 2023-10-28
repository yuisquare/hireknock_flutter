import 'package:flutter/material.dart';
import '../text/h_text.dart';

class HCheckbox extends StatelessWidget {
  const HCheckbox(
      {Key? key,
      required this.value,
      required this.onChecked,
      this.size = 24,
      this.label,
      this.labelSize})
      : super(key: key);

  final bool value;
  final String? label;
  final double size;
  final dynamic Function(bool?) onChecked;
  final double? labelSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Checkbox(
            value: value,
            onChanged: onChecked,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        if (label != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: HText(
                text: label!,
                fontSize: labelSize ?? 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
              ),
            ),
          ),
      ],
    );
  }
}
