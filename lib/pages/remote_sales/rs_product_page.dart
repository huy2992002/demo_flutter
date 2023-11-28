import 'package:demo_flutter/models/rs_product_model.dart';
import 'package:demo_flutter/pages/remote_sales/rs_product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/hi_boss_app_bar.dart';
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
          Container(
            color: Colors.white,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 18.0,
                ),
                hintText: 'Tìm kiếm ...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: SvgPicture.asset(
                  'assets/icons/ic_menu_search.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
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
