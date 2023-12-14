import 'package:demo_flutter/models/rs_product_model.dart';
import 'package:demo_flutter/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsProductItem extends StatelessWidget {
  const RsProductItem({
    super.key,
    required this.rsProduct,
    this.onPressed,
    this.saveOnPressed,
  });

  final RsProductModel rsProduct;
  final Function()? onPressed;
  final Function()? saveOnPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                rsProduct.background ?? '',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6.0),
                  Text(
                    rsProduct.name ?? '',
                    style: const TextStyle(
                      color: Color(0xFF48484A),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      if (rsProduct.price != null) ...[
                        Text(
                          (rsProduct.price!).toVnd(),
                          style: const TextStyle(
                            color: Color(0xFF949499),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 2.0),
                      ],
                      Text(
                        (rsProduct.priceSale!).toVnd(),
                        style: const TextStyle(
                          color: Color(0xFFF04438),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '/${rsProduct.unit}',
                        style: const TextStyle(
                          color: Color(0xFF48484A),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Đã bán: ${rsProduct.sole}',
                        style: const TextStyle(
                          color: Color(0xFF12B76A),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: GestureDetector(
                onTap: saveOnPressed,
                child: SvgPicture.asset(
                  (rsProduct.isSave ?? false)
                      ? 'assets/icons/ic_bookmark.svg'
                      : 'assets/icons/ic_bookmark _outlined.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
