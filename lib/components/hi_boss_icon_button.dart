import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/app_color.dart';

class HiBossIconButton extends StatelessWidget {
  const HiBossIconButton({
    super.key,
    required this.icon,
    this.color = Colors.white,
    this.iconColor = AppColor.h039855,
  });

  final String icon;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: iconColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: iconColor,
      ),
    );
  }
}
