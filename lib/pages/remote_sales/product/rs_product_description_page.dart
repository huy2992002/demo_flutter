import 'package:demo_flutter/models/rs_product_description_model.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

import '../../../components/button/hi_boss_app_bar.dart';

class RsProductDescriptionPage extends StatelessWidget {
  const RsProductDescriptionPage({
    super.key,
    required this.productName,
    required this.productDescription,
  });

  final String productName;
  final RsProductDescriptionModel productDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HiBossAppBar(
        leftPressed: () => Navigator.pop(context),
        leftIcon: 'assets/icons/ic_back.svg',
        rightIcon: 'assets/icons/ic_solar_copy.svg',
        title: 'Mô tả sản phẩm',
      ),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 20.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              '$productName \n (${productDescription.fit})',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(
            '- Mô tả chung',
            style: AppStyle.h14w700,
          ),
          Text(
            productDescription.description ?? '',
            style: AppStyle.h14w400,
          ),
          const SizedBox(height: 20.0),
          const Text(
            '- Lộ trình khóa học',
            style: AppStyle.h14w700,
          ),
          Text(
            productDescription.route ?? '',
            style: AppStyle.h14w400,
          ),
          ...List.generate(
            productDescription.stepsRoute?.length ?? 0,
            (index) =>
                Text('+ Vòng $index: ${productDescription.stepsRoute?[index]}'),
          ),
          const SizedBox(height: 20.0),
          const Text(
            '- Điểm khác biệt của khóa học',
            style: AppStyle.h14w700,
          ),
          Text(
            productDescription.difference ?? '',
            style: AppStyle.h14w400,
          ),
          const SizedBox(height: 20.0),
          const Text(
            '- Những kỹ năng mà bé nhận được',
            style: AppStyle.h14w700,
          ),
          ...List.generate(
            productDescription.benefits?.length ?? 0,
            (index) => Text(
              '+ ${productDescription.benefits?[index]}',
              style: AppStyle.h14w400,
            ),
          ),
        ],
      ),
    );
  }
}
