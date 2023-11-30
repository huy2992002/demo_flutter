import 'package:demo_flutter/components/button/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/button/hi_boss_elevated_button.dart';
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
  List<RsProductModel> listSelectCart = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF6F8FF,
      appBar: HiBossAppBar(
        leftPressed: () => Navigator.pop(context),
        leftIcon: 'assets/icons/ic_back.svg',
        title: 'Giỏ hàng',
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 16.0, bottom: 120.0),
            itemCount: cartRsProducts.length,
            itemBuilder: (context, index) {
              final product = cartRsProducts.reversed.toList()[index];
              return RsProductCart(
                onPressed: () {
                  product.isSelectCart = !(product.isSelectCart ?? false);
                  for (RsProductModel p in listSelectCart) {
                    if (product.id == p.id) {
                      listSelectCart.remove(product);
                      setState(() {});
                      return;
                    }
                  }
                  listSelectCart.add(product);
                  setState(() {});
                },
                product: product,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 14.0),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              color: Colors.white,
              child: HiBossElevatedButton(
                text: listSelectCart.isEmpty
                    ? 'Chưa có sản phẩm nào được chọn'
                    : 'Tạo đơn ${listSelectCart.length} sản phẩm đã chọn',
                color: AppColor.h063782,
                borderColor: AppColor.h063782,
                radius: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
