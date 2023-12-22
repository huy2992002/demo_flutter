import 'package:demo_flutter/models/rs_pr_category_model.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsCategoryItem extends StatelessWidget {
  const RsCategoryItem({
    super.key,
    required this.rsPrCategorie,
  });

  final RsPrCategoryModel rsPrCategorie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(rsPrCategorie.logo ?? ''),
        const SizedBox(height: 6.0),
        Text(
          rsPrCategorie.name ?? '',
          style: AppStyle.h14w600,
        ),
      ],
    );
  }
}
