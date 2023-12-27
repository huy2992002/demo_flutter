import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/rs_pr_category_model.dart';
import 'package:demo_flutter/models/rs_product_model.dart';
import 'package:demo_flutter/pages/remote_sales/product/rs_product_detail_page.dart';
import 'package:demo_flutter/pages/remote_sales/product/widgets/rs_product_item.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

class RsCategoryDetailPage extends StatefulWidget {
  const RsCategoryDetailPage({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<RsCategoryDetailPage> createState() => _RsCategoryDetailPageState();
}

class _RsCategoryDetailPageState extends State<RsCategoryDetailPage> {
  List<RsProductModel> productCategories = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() {
    for (RsProductModel pr in rsProducts) {
      for (RsPrCategoryModel ca in pr.categories ?? []) {
        if ((ca.name ?? '') == widget.category) {
          productCategories.add(pr);
          break;
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hFBFBFB,
      appBar: HiBossAppBar(
        leftIcon: 'assets/icons/ic_back.svg',
        leftPressed: () => Navigator.pop(context),
        title: 'Sản Phẩm ${widget.category}',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final product = productCategories[index];
          return RsProductItem(
            rsProduct: product,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RsProductDetailPage(rsProduct: product),
              ),
            ),
            saveOnPressed: () {
              setState(() {
                product.isSave = !(product.isSave ?? false);
              });
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 14.0,
        ),
        itemCount: productCategories.length,
      ),
    );
  }
}
