import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HiBossElevatedButton extends StatelessWidget {
  const HiBossElevatedButton({
    super.key,
    required this.text,
    this.icon,
    this.color = AppColor.h12B76A,
    this.borderColor = AppColor.h12B76A,
    this.textColor = Colors.white,
  });

  const HiBossElevatedButton.outlined({
    super.key,
    required this.text,
    this.icon,
    this.color = Colors.white,
    this.borderColor = AppColor.h12B76A,
    this.textColor = AppColor.h12B76A,
  });

  final String text;
  final String? icon;
  final Color color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            SvgPicture.asset(
              icon!,
              // ignore: deprecated_member_use
              color: textColor,
            ),
            const SizedBox(width: 10.0),
          ],
          Text(
            text,
            style: AppStyle.h15w600.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
