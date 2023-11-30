import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HiBossElevatedButton extends StatelessWidget {
  const HiBossElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.color = AppColor.h12B76A,
    this.borderColor = AppColor.h12B76A,
    this.textColor = Colors.white,
  });

  const HiBossElevatedButton.outlined({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.color = Colors.white,
    this.borderColor = AppColor.h12B76A,
    this.textColor = AppColor.h12B76A,
  });

  final Function()? onPressed;
  final String text;
  final String? icon;
  final Color color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              style: AppStyle.h14w400.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
