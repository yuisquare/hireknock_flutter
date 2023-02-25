import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_knock/app_constants/app_colors.dart';

import 'input_style.dart';

class HInputTextField extends StatelessWidget {
  const HInputTextField({
    Key? key,
    this.hintText,
    this.label,
    this.disabledHint,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
    this.width,
    this.controller,
    this.filled = false,
    this.fillColor,
    this.enabled = true,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.inputFormatters,
    this.keyboardType,
    this.isRequired = false,
    this.validator,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
  final String? disabledHint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final bool readOnly;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;

  final Color? borderColor;
  final double? borderRadius;

  final double? height;
  final double? width;
  final bool filled;
  final Color? fillColor;
  final bool enabled;
  final double fontSize;
  final FontWeight fontWeight;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool isRequired;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'This field is required';
        }
        if (validator != null) {
          return validator!(value);
        }

        return null;
      },
      inputFormatters: inputFormatters,
      enabled: enabled,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      obscuringCharacter: '*',
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: AppColor.fieldTextColor,
      ),
      decoration: InputStyle.getInputDecoration(
        labelText: label,
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
    );
  }
}
