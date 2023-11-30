import 'package:demo_flutter/components/button/hi_boss_elevated_button.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class HiBossDialog {
  HiBossDialog._();

  static void dialog(
    BuildContext context, {
    required String title,
    required String content,
    required String confirm,
    required String cancel,
    Function()? action,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Text(
          title,
          style: AppStyle.h20w600,
        )),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              color: AppColor.hC1C1C7,
              height: 1.0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                content,
                style: AppStyle.h14w400.copyWith(color: AppColor.h434343),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: HiBossElevatedButton.outlined(
                  onPressed: () => Navigator.pop(context, false),
                  text: cancel,
                  borderColor: AppColor.h063782,
                  textColor: AppColor.h063782,
                ),
              ),
              const SizedBox(width: 10.0),
              HiBossElevatedButton(
                onPressed: () {
                  action?.call();
                  Navigator.pop(context, true);
                },
                text: confirm,
                color: AppColor.h063782,
                borderColor: AppColor.h063782,
              ),
            ],
          )
        ],
      ),
    );
  }
}
