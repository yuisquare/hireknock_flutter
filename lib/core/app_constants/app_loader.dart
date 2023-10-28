import 'package:flutter/material.dart';
import 'package:hire_knock/core/app_services/navigator_service.dart';
import 'package:hire_knock/utils/logger.dart';
import 'package:hire_knock/widgets/progress/h_progress_indicator.dart';

class AppLoader {
  static Future<dynamic> show({String? title, bool canCancel = false}) async {
    Logger.info('Show loader');
    return showDialog(
      context: NavigatorService.context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HProgressIndicator(),
                  const SizedBox(height: 10),
                  Text(
                    title ?? 'Loading...',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  if (canCancel)
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static close() {
    Navigator.pop(NavigatorService.context);
    Logger.info('Close loader');
  }
}
