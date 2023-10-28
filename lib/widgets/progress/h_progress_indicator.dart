import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../core/app_constants/app_colors.dart';

enum ProgressType {
  circular,
  ballPulseSync,
}

class HProgressIndicator extends StatelessWidget {
  const HProgressIndicator({super.key, this.type = ProgressType.ballPulseSync});

  final ProgressType type;

  @override
  Widget build(BuildContext context) {
    return Center(child: getLoader(type));
  }

  Widget getLoader(ProgressType type) {
    switch (type) {
      case ProgressType.circular:
        return CircularProgressIndicator(
          color: Colors.grey.shade300,
        );
      case ProgressType.ballPulseSync:
        return const SizedBox(
          width: 80,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: [AppColor.primary, AppColor.highlight, AppColor.secondary],
          ),
        );
    }
  }
}
