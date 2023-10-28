import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

import 'input_style.dart';

class HInputDropdownField<T> extends StatelessWidget {
  const HInputDropdownField({
    super.key,
    this.hintText,
    this.label,
    this.disabledHint,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
    this.width,
    this.controller,
    this.filled = false,
    this.fillColor,
    this.enabled = true,
    this.fontSize = 18,
    this.inputFormatters,
    this.keyboardType,
    this.isRequired = false,
    this.validator,
    required this.items,
    this.value,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
  final String? disabledHint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(T?)? onChanged;
  final Function()? onTap;
  final Function(T?)? onSaved;
  final EdgeInsetsGeometry? padding;

  final Color? borderColor;
  final double? borderRadius;
  final bool readOnly;
  final double? height;
  final double? width;
  final bool filled;
  final Color? fillColor;
  final bool enabled;
  final double fontSize;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool isRequired;
  final EdgeInsetsGeometry? contentPadding;
  final T? value;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HText(
                    text: label ?? '',
                    fontSize: 18,
                    isHeader: true,
                    fontWeight: FontWeight.bold,
                  ),
                  if (isRequired)
                    const HText(
                      text: '*',
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                ],
              ),
              if (!enabled && disabledHint != '') ...[
                HSpace.vertical(5),
                HText(
                  text: disabledHint ?? 'Information cannot be changed',
                  fontSize: 12,
                  isHeader: true,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.bold,
                ),
              ]
            ],
          ),
          HSpace.vertical(10),
        ],
        DropdownButtonFormField<T>(
          items: items,
          value: value,
          onChanged: enabled ? onChanged : null,
          onTap: onTap,
          onSaved: onSaved,
          style: TextStyle(fontSize: fontSize),
          isExpanded: true,
          itemHeight: null,
          decoration: InputStyle.getInputDecoration(
            filled: filled,
            fillColor: fillColor,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: contentPadding,
            fontSize: fontSize,
            borderRadius: borderRadius,
            borderColor: borderColor,
          ),
        ),
        // TextFormField(
        //   validator: (value) {
        //     if (isRequired && (value == null || value.isEmpty)) {
        //       return 'This field is required';
        //     }
        //     if (validator != null) {
        //       validator!(value);
        //     }

        //     return null;
        //   },
        //   inputFormatters: inputFormatters,
        //   enabled: enabled,
        //   controller: controller,
        //   onChanged: onChanged,
        //   onSaved: onSaved,

        //   readOnly: readOnly,
        //   obscureText: obscureText,
        //   maxLength: maxLength,
        //   maxLines: maxLines ?? 1,
        //   keyboardType: keyboardType,

        //   decoration: InputDecoration(
        //     filled: filled,
        //     fillColor: fillColor,
        //     hintText: hintText,
        //     suffixIcon: suffixIcon,
        //     prefixIcon: prefixIcon,
        //     contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        //     hintMaxLines: 1,
        //     alignLabelWithHint: true,
        //     hintStyle: TextStyle(fontSize: fontSize.sp),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(borderRadius),
        //       borderSide: BorderSide(color: borderColor),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(borderRadius),
        //       borderSide: BorderSide(color: borderColor),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(borderRadius),
        //       borderSide: BorderSide(color: borderColor),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
