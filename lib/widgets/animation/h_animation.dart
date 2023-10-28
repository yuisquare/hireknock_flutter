import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

enum HireKnockAnimation {
  fadeInUp,
  zoomIn,
}

class HAnimation extends StatelessWidget {
  const HAnimation({
    super.key,
    required this.animation,
    required this.child,
  });

  final HireKnockAnimation animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    switch (animation) {
      case HireKnockAnimation.fadeInUp:
        return FadeInUp(child: child);
      case HireKnockAnimation.zoomIn:
        return ZoomIn(child: child);
    }
  }
}
