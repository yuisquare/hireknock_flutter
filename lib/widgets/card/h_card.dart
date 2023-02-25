import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/container/h_container.dart';

enum CardColor {
  darkblue,
  lightblue,
  redorange,
  darkblueInverse,
  bgLightBlue,
  bgRedOrange,
}

class HCard extends StatelessWidget {
  const HCard({
    Key? key,
    required this.cardColor,
    this.width,
    this.height,
    this.borderRadius = 30,
    this.elevation = 12,
    required this.child,
  }) : super(key: key);
  final CardColor cardColor;
  final double? width;
  final double? height;
  final Widget child;
  final double borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      child: HContainer(
        padding: const EdgeInsets.all(16.0),
        borderRadius: BorderRadius.circular(borderRadius),
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
