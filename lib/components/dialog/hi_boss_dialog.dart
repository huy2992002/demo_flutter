import 'package:demo_flutter/components/button/hi_boss_elevated_button.dart';
import 'package:demo_flutter/resources/app_color.dart';
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
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: const TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          HiBossElevatedButton(
            onPressed: () {
              action?.call();
              Navigator.pop(context, true);
            },
            text: confirm,
            color: Colors.white,
            borderColor: AppColor.h063782,
            textColor: AppColor.h063782,
          ),
          HiBossElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            text: cancel,
            color: AppColor.h063782,
            borderColor: AppColor.h063782,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
