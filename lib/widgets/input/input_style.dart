import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_knock/app_constants/app_colors.dart';

class InputStyle {
  static InputDecoration getInputDecoration({
    bool filled = false,
    Color? fillColor,
    String? hintText,
    String? labelText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    EdgeInsetsGeometry? contentPadding,
    double? fontSize,
    double? borderRadius,
    Color? borderColor,
  }) {
    return InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: fillColor ?? AppColor.fieldColor,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
      hintMaxLines: 1,
      hintStyle: GoogleFonts.poppins(
        fontSize: fontSize,
        color: Colors.grey.shade500,
      ),
      labelStyle: GoogleFonts.poppins(
        fontSize: fontSize,
        color: Colors.grey.shade500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: BorderSide(
          color: borderColor ?? AppColor.fieldColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: BorderSide(
          color: borderColor ?? AppColor.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: BorderSide(
          color: borderColor ?? AppColor.fieldColor,
        ),
      ),
    );
  }
}
