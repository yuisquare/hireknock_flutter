import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/container/h_container.dart';

import '../../core/app_constants/app_colors.dart';
import '../text/h_text.dart';

class HToggleButtonMobile extends StatefulWidget {
  const HToggleButtonMobile({
    super.key,
    required this.items,
    required this.onChanged,
    this.width,
    this.activeBGColor,
    this.inActiveBGColor,
    this.activeTextColor,
    this.inActiveTextColor,
    required this.initialValue,
    this.padding,
    this.fontSize,
  });

  final List<String> items;
  final String initialValue;
  final Function(String) onChanged;
  final double? width;
  final Color? activeBGColor;
  final Color? inActiveBGColor;
  final Color? activeTextColor;
  final Color? inActiveTextColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  @override
  State<HToggleButtonMobile> createState() => _HToggleButtonMobileState();
}

class _HToggleButtonMobileState extends State<HToggleButtonMobile> {
  String selectedItem = '';

  @override
  void initState() {
    selectedItem = widget.initialValue;
    super.initState();
  }

  bool _isSelected(String item) => selectedItem == item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.items.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedItem = widget.items[index];
            });
            widget.onChanged(widget.items[index]);
          },
          child: HContainer(
            isAnimated: true,
            isResponsive: false,
            width: widget.width ?? 50,
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: _isSelected(widget.items[index])
                ? const Border(
                    bottom: BorderSide(color: AppColor.secondary, width: 3.0))
                : const Border(bottom: BorderSide(color: Colors.black26, width: 2.0)),
            child: Center(
              child: HText(
                text: widget.items[index],
                fontSize: widget.fontSize ?? 14,
                fontWeight: FontWeight.w600,
                color: _isSelected(widget.items[index])
                    ? widget.activeTextColor ?? AppColor.secondary
                    : widget.inActiveTextColor ?? Colors.black87,
              ),
            ),
          ),
        );
      }),
    );
  }
}
