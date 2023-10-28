import 'package:flutter/material.dart';
import 'package:hire_knock/core/app_services/navigator_service.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

enum SnackType { info, success, error }

class AppSnackbar {
  static void success(String message) =>
      _show(message: message, snackType: SnackType.success);
  static void error(String message) =>
      _show(message: message, snackType: SnackType.error);
  static void info(String message) => _show(message: message);

  static void _show({
    required String message,
    SnackType snackType = SnackType.info,
  }) {
    ScaffoldMessenger.of(NavigatorService.context).removeCurrentSnackBar();
    ScaffoldMessenger.of(NavigatorService.context).showSnackBar(
      SnackBar(
        content: HText(
          text: message,
          fontSize: 14,
          color: Colors.white,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 500,
        behavior: SnackBarBehavior.floating,
        backgroundColor: _getColor(snackType),
        elevation: 0,
      ),
    );
  }

  static Color? _getColor(SnackType snackType) {
    switch (snackType) {
      case SnackType.info:
        return null;
      case SnackType.success:
        return Colors.green;
      case SnackType.error:
        return Colors.red;
    }
  }
}
