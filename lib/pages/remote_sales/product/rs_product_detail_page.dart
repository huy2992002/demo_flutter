import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_flutter/components/dialog/hi_boss_dialog.dart';
import 'package:demo_flutter/models/rs_product_description_model.dart';
import 'package:demo_flutter/models/rs_product_user_manual_model.dart';
import 'package:demo_flutter/pages/remote_sales/product/rs_product_cart_page.dart';
import 'package:demo_flutter/pages/remote_sales/product/rs_product_description_page.dart';
import 'package:demo_flutter/utils/extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/button/hi_boss_app_bar.dart';
import '../../../components/button/hi_boss_elevated_button.dart';
import '../../../components/button/hi_boss_icon_button.dart';
import '../../../models/rs_product_model.dart';
import 'rs_product_user_manual_page.dart';

class RsProductDetailPage extends StatefulWidget {
  const RsProductDetailPage({
    super.key,
    required this.rsProduct,
  });

  final RsProductModel rsProduct;

  @override
  State<RsProductDetailPage> createState() => _RsProductDetailPageState();
}

class _RsProductDetailPageState extends State<RsProductDetailPage> {
  int imageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  double get totalCommissionReceived =>
      (widget.rsProduct.priceSale ?? 0) *
      (((widget.rsProduct.detail?.commissionReceived ?? 0) / 100));

  void checkAddCart() {
    for (RsProductModel p in cartRsProducts) {
      if (p.id == widget.rsProduct.id) {
        HiBossDialog.dialog(
          context,
          title: 'Thống báo',
          content: 'Sản phẩm đã có trong giỏ hàng rồi',
          confirm: 'Xem giỏ hàng',
          cancel: 'Quay lại',
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RsProductCartPage(),
              ),
            );
          },
        );
        return;
      }
    }
    cartRsProducts.add(widget.rsProduct);
    HiBossDialog.dialog(
      context,
      title: 'Thành công',
      content: 'Sản phẩm đã được thêm vào giỏ hàng của bạn!',
      confirm: 'Xem giỏ hàng',
      cancel: 'Quay lại',
      action: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RsProductCartPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: HiBossAppBar(
        leftIcon: 'assets/icons/ic_back.svg',
        leftPressed: () {
          Navigator.pop(context);
        },
        title: 'Chi tiết sản phẩm',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: widget.rsProduct.detail?.images?.length ?? 0,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    imageIndex = index;
                    setState(() {});
                  },
                  height: 200,
                  autoPlay: true,
                  viewportFraction: 0.6,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(
                        image: AssetImage(
                          widget.rsProduct.detail?.images?[index] ?? '',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    widget.rsProduct.detail?.images?.length ?? 0,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: imageIndex == index
                            ? const Color(0xFF608AF7)
                            : const Color(0xFFAFC5FB),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.rsProduct.name ?? '',
                      style: const TextStyle(
                        color: Color(0xFF3A3A3C),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.rsProduct.isSave =
                          !(widget.rsProduct.isSave ?? false);
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      (widget.rsProduct.isSave ?? false)
                          ? 'assets/icons/ic_bookmark.svg'
                          : 'assets/icons/ic_bookmark _outlined.svg',
                    ),
                  ),
                ],
              ),
            ),
            if (widget.rsProduct.price != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  (widget.rsProduct.price!).toVnd(),
                  style: const TextStyle(
                    color: Color(0xFF949499),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(bottom: 16.0),
              child: Row(
                children: [
                  Text(
                    (widget.rsProduct.priceSale!).toVnd(),
                    style: const TextStyle(
                      color: Color(0xFFF04438),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '/${widget.rsProduct.unit ?? '-:-'}',
                    style: const TextStyle(
                      color: Color(0xFF48484A),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 4, thickness: 4, color: Color(0xFFEDEDF2)),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _viewDetail(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RsProductDescriptionPage(
                              productName: widget.rsProduct.name ?? '',
                              productDescription:
                                  widget.rsProduct.detail?.description ??
                                      rsPDescription,
                            ),
                          ),
                        );
                      },
                      text: 'Xem mô tả sản phẩm'),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: _buildDescription(
                            title: 'Mã sản phẩm',
                            infomation: widget.rsProduct.id ?? '-:-'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: _buildDescription(
                            title: 'Số lượng bán:',
                            infomation: '${widget.rsProduct.sole ?? 0}'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: _buildDescription(
                            title: 'Đơn vị:',
                            infomation: widget.rsProduct.unit ?? '-:-'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: _buildDescription(
                            title: 'Hoa hồng nhận được:',
                            infomation:
                                '${widget.rsProduct.detail?.commissionReceived ?? 0}% (${totalCommissionReceived.toVnd()})'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  _viewDetail(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PsProductUserManualPage(
                                userManual:
                                    widget.rsProduct.detail?.userManual ??
                                        rsPUserManual,
                              ),
                            ));
                      },
                      text: 'Xem hướng dẫn sử dụng'),
                ],
              ),
            ),
            const Divider(height: 4, thickness: 4, color: Color(0xFFEDEDF2)),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Doanh nghiệp cung cấp sản phẩm:',
                    style: TextStyle(
                      color: Color(0xFF636366),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          widget.rsProduct.detail?.enterprise?.image ?? '',
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.rsProduct.detail?.enterprise?.name ?? '',
                              style: const TextStyle(
                                color: Color(0xFF28282A),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            _buildEnterprise(
                              title: 'Website:',
                              infomation: widget
                                      .rsProduct.detail?.enterprise?.website ??
                                  '',
                            ),
                            _buildEnterprise(
                              title: 'Địa chỉ:',
                              infomation: widget
                                      .rsProduct.detail?.enterprise?.address ??
                                  '',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HiBossIconButton(
              onPressed: () {
                checkAddCart();
              },
              icon: 'assets/icons/ic_solar_carr.svg',
            ),
            const SizedBox(width: 14.0),
            const Expanded(
              child: HiBossElevatedButton(
                icon: 'assets/icons/ic_edit.svg',
                text: 'Tạo đơn',
              ),
            ),
            const SizedBox(width: 14.0),
            const Expanded(
              child: HiBossElevatedButton.outlined(
                icon: 'assets/icons/ic_shared.svg',
                text: 'Chia sẻ',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEnterprise({required String title, required String infomation}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF636366),
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Text(
            infomation,
            style: const TextStyle(
              color: Color(0xFF48484A),
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildDescription(
      {required String title, required String infomation}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF636366),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          infomation,
          style: const TextStyle(
            color: Color(0xFF28282A),
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _viewDetail({Function()? onPressed, required String text}) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Color(0xFF063782),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline),
          ),
          const SizedBox(width: 4.0),
          SvgPicture.asset('assets/icons/ic_expand_more.svg')
        ],
      ),
    );
  }
}
