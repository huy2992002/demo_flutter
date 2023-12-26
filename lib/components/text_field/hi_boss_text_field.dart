import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class HiBossTextField extends StatelessWidget {
  const HiBossTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.secondText,
    this.hintText,
    this.request = false,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String labelText;
  final String? secondText;
  final String? hintText;
  final bool request;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder underlineInputBorder({Color? color}) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: color ?? AppColor.hE6E6E9),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: AppStyle.h13w600.copyWith(color: AppColor.h434343),
            ),
            if (request == true)
              Text(
                ' *',
                style: AppStyle.h13w600.copyWith(color: AppColor.hDC3545),
              ),
            const Spacer(),
            if (secondText != null)
              Text(
                secondText!,
                style: AppStyle.h14w500.copyWith(color: AppColor.hB8B8BF),
              ),
          ],
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyle.h14w400,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            border: underlineInputBorder(),
            enabledBorder: underlineInputBorder(),
            focusedBorder: underlineInputBorder(),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
