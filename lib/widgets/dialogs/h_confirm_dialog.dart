import 'package:flutter/material.dart';
import 'package:hire_knock/core/app_services/navigator_service.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

import '../button/h_button.dart';

class HConfirmDialog {
  static void delete({
    String? message,
    String? title,
    required Function() onDelete,
    Function()? onCancel,
  }) {
    showDialog(
      context: NavigatorService.context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: HText(
            text: title ?? 'Are you sure?',
            textAlign: TextAlign.center,
          ),
          content: HText(
              text: message ?? 'The selected item will be deleted permanently'),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            HButton(
              onPress: onCancel ??
                  () {
                    NavigatorService.pop();
                  },
              text: 'CANCEL',
            ),
            HButton(
              onPress: onDelete,
              text: 'DELETE',
              backgroundColor: Colors.red,
            )
          ],
        );
      },
    );
  }
}
