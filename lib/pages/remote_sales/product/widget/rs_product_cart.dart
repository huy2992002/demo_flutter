import 'package:demo_flutter/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../models/rs_product_model.dart';
import '../../../../resources/app_color.dart';
import '../../../../resources/app_style.dart';

class RsProductCart extends StatelessWidget {
  const RsProductCart({
    super.key,
    this.onPressed,
    required this.product,
  });

  final Function()? onPressed;
  final RsProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: (product.isSelectCart ?? false)
                ? AppColor.h274CAC
                : Colors.white,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                product.background ?? '',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name ?? '',
                          style: AppStyle.h14w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: SvgPicture.asset(
                          (product.isSelectCart ?? false)
                              ? 'assets/icons/ic_check_box.svg'
                              : 'assets/icons/ic_check_box_outline_blank.svg',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      if (product.price != null) ...[
                        Text(
                          product.price!.toVnd(),
                          style: AppStyle.h12w400.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                      ],
                      Text(
                        (product.priceSale ?? 0.0).toVnd(),
                        style: AppStyle.h12w700,
                      ),
                      Text(
                        '/${product.unit ?? ''}',
                        style: AppStyle.h12w500,
                      ),
                      const Spacer(),
                      Text(
                        'Đã bán: ${product.sole}',
                        style: AppStyle.h12w500.copyWith(
                          color: AppColor.h12B76A,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
