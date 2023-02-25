import 'package:flutter/material.dart';
import 'package:hire_knock/app_services/navigator_service.dart';

enum SnackType { info, success, error }

class AppSnackbar {
  static void show({
    required String message,
    SnackType snackType = SnackType.info,
  }) {
    ScaffoldMessenger.of(NavigatorService.context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _getColor(snackType),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(NavigatorService.context)
                .hideCurrentSnackBar();
          },
        ),
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
