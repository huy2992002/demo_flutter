import 'package:demo_flutter/components/text_field/hi_boss_search_box.dart';
import 'package:demo_flutter/models/rs_product_model.dart';
import 'package:flutter/material.dart';
import '../../../components/hi_boss_app_bar.dart';
import 'rs_product_detail_page.dart';
import 'widget/rs_product_item.dart';

class RsProductPage extends StatefulWidget {
  const RsProductPage({super.key});

  @override
  State<RsProductPage> createState() => _RsProductPageState();
}

class _RsProductPageState extends State<RsProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: const HiBossAppBar(
        rightIcon: 'assets/icons/ic_refresh.svg',
        title: 'Sản phẩm HiBoss',
      ),
      body: Column(
        children: [
          const HiBossSearchBox(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: rsProducts.length,
              itemBuilder: (context, index) {
                final rsProduct = rsProducts[index];
                return RsProductItem(
                  rsProduct: rsProduct,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RsProductDetailPage(rsProduct: rsProduct),
                      ),
                    );
                  },
                  saveOnPressed: () {
                    rsProduct.isSave = !(rsProduct.isSave ?? false);
                    setState(() {});
                  },
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
