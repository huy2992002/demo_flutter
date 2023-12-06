import 'package:demo_flutter/components/button/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/button/hi_boss_elevated_button.dart';
import 'package:demo_flutter/models/customer_model.dart';
import 'package:demo_flutter/models/rs_product_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:demo_flutter/utils/extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RsProductCreateOrder extends StatefulWidget {
  const RsProductCreateOrder({
    super.key,
    required this.product,
  });
  final RsProductModel product;

  @override
  State<RsProductCreateOrder> createState() => _RsProductCreateOrderState();
}

class _RsProductCreateOrderState extends State<RsProductCreateOrder> {
  int quantity = 1;
  double deliveryCharges = 60000.0;
  double discount = 2 / 100;

  double get getSumPrice {
    return quantity * (widget.product.priceSale ?? 0.0);
  }

  double get getDiscount {
    return getSumPrice * discount;
  }

  double get getTotal {
    return getSumPrice + deliveryCharges - getDiscount;
  }

  double get getCommissionReceived {
    return getTotal * ((widget.product.detail?.commissionReceived ?? 0) / 100);
  }

  List<Color> labelColors = [
    AppColor.hFFA1A1,
    AppColor.h56CBBC,
    AppColor.hA9CD89,
  ];

  final underlineInputBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColor.hE6E6E9),
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColor.hF2F2FF,
        appBar: HiBossAppBar(
          leftIcon: 'assets/icons/ic_back.svg',
          leftPressed: () => Navigator.pop(context),
          title: 'Tạo Đơn Hàng',
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 120.0),
              children: [
                _buildContainer(
                  color: AppColor.hEDEDF2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mã đơn hàng',
                        style: AppStyle.h13w600,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 17.0, top: 14.0, bottom: 6.0),
                        child: Text(
                          '#${widget.product.id ?? '-:-'}',
                          style: AppStyle.h14w600
                              .copyWith(color: AppColor.h949499),
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: AppColor.hE6E6E9,
                      ),
                      const SizedBox(height: 24.0),
                      const Text(
                        'Ngày tạo đơn',
                        style: AppStyle.h13w600,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 17.0, top: 14.0, bottom: 6.0),
                        child: Text(
                          widget.product.createOrderAt.toDateTimeFormat(),
                          style: AppStyle.h14w600
                              .copyWith(color: AppColor.h949499),
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: AppColor.hE6E6E9,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mô tả đơn hàng',
                        style:
                            AppStyle.h13w600.copyWith(color: AppColor.h434343),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: underlineInputBorder,
                          enabledBorder: underlineInputBorder,
                          focusedBorder: underlineInputBorder,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Sản phẩm',
                      style: AppStyle.h15w600.copyWith(color: AppColor.h434343),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: AppStyle.h15w600
                              .copyWith(color: AppColor.hDC3545),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              widget.product.background ?? '',
                              width: 64.0,
                              height: 64.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.name ?? '-:-',
                                  style: AppStyle.h15w600
                                      .copyWith(color: Colors.black),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4.0),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.product.price == null
                                                ? ''
                                                : (widget.product.price!)
                                                    .toVnd(),
                                            style: AppStyle.h13w400,
                                          ),
                                          const SizedBox(height: 4.0),
                                          RichText(
                                            text: TextSpan(
                                              text: (widget.product.priceSale ??
                                                      00)
                                                  .toVnd(),
                                              style: AppStyle.h15w700,
                                              children: [
                                                TextSpan(
                                                    text: '/Kg',
                                                    style: AppStyle.h15w600
                                                        .copyWith(
                                                            color:
                                                                Colors.black)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.hF2F2FF,
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (quantity > 1) {
                                                quantity = quantity - 1;
                                              }
                                              setState(() {});
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/ic_minus.svg',
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            height: 24.0,
                                            alignment: Alignment.center,
                                            child: Text('$quantity'),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              quantity = quantity + 1;
                                              setState(() {});
                                            },
                                            child: SvgPicture.asset(
                                                'assets/icons/ic_plus.svg'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 24.0,
                        thickness: 1.0,
                        color: AppColor.hC0C0CE,
                      ),
                      _buildRowPay(
                        title: 'Tổng sản phẩm',
                        info: getSumPrice.toVnd(),
                      ),
                      _buildRowPay(
                        title: 'Phí giao hàng',
                        info: deliveryCharges.toVnd(),
                      ),
                      _buildRowPay(
                        title: 'Khuyến mãi',
                        info: '- ${getDiscount.toVnd()}',
                      ),
                      _buildRowPay(
                        title: 'Thành tiền:',
                        info: getTotal.toVnd(),
                        titleStyle: AppStyle.h15w500,
                        infoStyle: AppStyle.h15w700,
                      ),
                      const Divider(
                        height: 24.0,
                        thickness: 1.0,
                        color: AppColor.hC0C0CE,
                      ),
                      _buildRowPay(
                        title: 'Phần trăm hoa hồng của sản phẩm',
                        info:
                            '${widget.product.detail?.commissionReceived ?? 0}% (${getCommissionReceived.toVnd()})',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/ic_add_product.svg'),
                      const SizedBox(width: 12.0),
                      const Text(
                        'Thêm sản phẩm',
                        style: AppStyle.h13w600,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: AppColor.hF5F5F5,
                  child: _buildChildContainer(
                    title: 'Tổng hoa hồng đơn hàng',
                    quantity: widget.product.detail?.commissionReceived ?? 0,
                    price: getCommissionReceived,
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: _buildChildContainer(
                    title: 'Áp dụng khuyến mãi',
                    quantity: 1,
                    price: getDiscount,
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        'Trạng thái ',
                        style: AppStyle.h13w600.copyWith(color: Colors.black),
                      ),
                      Text(
                        '*',
                        style:
                            AppStyle.h13w600.copyWith(color: AppColor.hDC3545),
                      ),
                      const Spacer(),
                      Text(
                        'Chờ bàn giao',
                        style:
                            AppStyle.h13w600.copyWith(color: AppColor.h0BA5EC),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nhãn dán',
                        style: AppStyle.h13w600.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: List.generate(
                          labelColors.length,
                          (index) => Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: labelColors[index]),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Text(
                              'Nhãn dán 1',
                              style: AppStyle.h12w500
                                  .copyWith(color: labelColors[index]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Ghi chú',
                              style: AppStyle.h14w500,
                            ),
                          ),
                          Text(
                            '0/200',
                            style: AppStyle.h14w500
                                .copyWith(color: AppColor.hB8B8BF),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: underlineInputBorder,
                          enabledBorder: underlineInputBorder,
                          focusedBorder: underlineInputBorder,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                _buildContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Khách hàng ',
                            style:
                                AppStyle.h13w600.copyWith(color: Colors.black),
                          ),
                          Text(
                            '*',
                            style: AppStyle.h13w600
                                .copyWith(color: AppColor.hDC3545),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              customer.avatar ?? '',
                              width: 74.0,
                              height: 74.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                customer.name ?? '',
                                style: AppStyle.h15w600.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(customer.phone ?? '',
                                  style: AppStyle.h13w400),
                              const SizedBox(height: 4.0),
                              Container(
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColor.h56CBBC),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Text(
                                  'Nhãn dán 2',
                                  style: AppStyle.h12w500
                                      .copyWith(color: AppColor.h56CBBC),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0)
                    .copyWith(top: 16.0, bottom: 35.0),
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 7.0)
                  ],
                ),
                child: const HiBossElevatedButton(
                  text: 'Tạo đơn hàng',
                  color: AppColor.h063782,
                  borderColor: AppColor.h063782,
                  radius: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer({Color? color, Widget? child}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }

  Column _buildChildContainer({
    required String title,
    required int quantity,
    required double price,
    Widget? widgetChild,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.h13w600,
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              '$quantity ',
              style: AppStyle.h15w600.copyWith(color: Colors.black),
            ),
            Expanded(
              child: Text(
                '(${price.toVnd()})',
                style: AppStyle.h13w600,
              ),
            ),
            if (widgetChild != null) widgetChild,
          ],
        ),
        const Divider(
          height: 3.0,
          thickness: 1.0,
          color: AppColor.hE6E6E9,
        ),
      ],
    );
  }

  Row _buildRowPay(
      {required String title,
      required String info,
      TextStyle? titleStyle,
      TextStyle? infoStyle}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: titleStyle ?? AppStyle.h13w500,
          ),
        ),
        Text(
          info,
          style: infoStyle ?? AppStyle.h13w500,
        )
      ],
    );
  }
}
