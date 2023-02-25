import 'package:flutter/material.dart';
import 'package:hire_knock/app_services/navigator_service.dart';
import 'package:hire_knock/widgets/button/h_button.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HDialog {
  static Future<dynamic> show({
    required String title,
    required Widget content,
    String? confirmBtnText,
    Function()? onConfirm,
    bool enableCancel = true,
    Function()? oncancel,
    bool enableScroll = false,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) async {
    return showDialog(
      context: NavigatorService.context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          scrollable: enableScroll,
          title: title == ''
              ? null
              : Center(
                  child: HText(
                    text: title,
                    color: Colors.black,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    isHeader: true,
                  ),
                ),
          contentPadding: EdgeInsets.all(20),
          content: content,
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.symmetric(vertical: 15),
          actions: actions ??
              [
                if (enableCancel)
                  HButton(
                    onPress: () {
                      oncancel == null ? NavigatorService.pop() : oncancel();
                    },
                    text: 'Cancel',
                  ),
                if (onConfirm != null)
                  HButton(
                    onPress: onConfirm,
                    text: confirmBtnText ?? 'Confirm',
                    backgroundColor: Colors.red,
                  )
              ],
        );
      },
    );
  }
}
