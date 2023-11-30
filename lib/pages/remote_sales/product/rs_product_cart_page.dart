import 'package:demo_flutter/components/button/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/rs_product_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

import 'widget/rs_product_cart.dart';

class RsProductCartPage extends StatefulWidget {
  const RsProductCartPage({super.key});

  @override
  State<RsProductCartPage> createState() => _RsProductCartPageState();
}

class _RsProductCartPageState extends State<RsProductCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF6F8FF,
      appBar: HiBossAppBar(
        leftPressed: () => Navigator.pop(context),
        leftIcon: 'assets/icons/ic_back.svg',
        title: 'Giỏ hàng',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0)
            .copyWith(top: 16.0, bottom: 76.0),
        itemCount: cartRsProducts.length,
        itemBuilder: (context, index) {
          final product = cartRsProducts[index];
          return RsProductCart(
            onPressed: () {
              product.isSelectCart = !(product.isSelectCart ?? false);
              setState(() {});
            },
            product: product,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 14.0),
      ),
    );
  }
}
