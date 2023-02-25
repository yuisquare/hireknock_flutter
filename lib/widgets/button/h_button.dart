import 'package:flutter/material.dart';
import 'package:hire_knock/app_constants/app_colors.dart';
import 'package:hire_knock/widgets/container/h_container.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HButton extends StatelessWidget {
  const HButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.padding,
    this.backgroundColor,
    this.overlayColor,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
    this.elevation,
    this.enabled = true,
  }) : super(key: key);

  final Function()? onPress;
  final String text;
  final Color? backgroundColor;
  final Color? overlayColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final double? elevation;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return HContainer(
      width: width,
      height: height ?? 30,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation:
              elevation == null ? null : MaterialStateProperty.all(elevation),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? AppColor.primary),
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            ),
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            prefixIcon ?? SizedBox(),
            if (prefixIcon != null) HSpace.horizonital(10),
            HText(
              textAlign: TextAlign.center,
              text: text,
              fontSize: 16,
              color: overlayColor,
              fontWeight: FontWeight.w600,
              isHeader: false,
            ),
            suffixIcon ?? SizedBox(),
            if (suffixIcon != null) HSpace.horizonital(10),
          ],
        ),
      ),
    );
  }
}
