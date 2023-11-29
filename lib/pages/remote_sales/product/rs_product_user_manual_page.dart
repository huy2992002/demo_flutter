import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/rs_product_user_manual_model.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class PsProductUserManualPage extends StatelessWidget {
  const PsProductUserManualPage({
    super.key,
    required this.userManual,
  });

  final RsProductUserManualModel userManual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HiBossAppBar(
        leftPressed: () => Navigator.pop(context),
        leftIcon: 'assets/icons/ic_back.svg',
        title: 'Hướng dẫn sử dụng',
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            userManual.text ?? '',
            style: AppStyle.h14w400,
          ),
          ...List.generate(
            userManual.steps?.length ?? 0,
            (index) => Text(
              '- ${userManual.steps?[index]}',
              style: AppStyle.h14w400,
            ),
          ),
        ],
      ),
    );
  }
}
