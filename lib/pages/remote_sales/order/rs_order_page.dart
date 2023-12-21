import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/text_field/hi_boss_search_box.dart';
import 'package:demo_flutter/models/rs_order_model.dart';
import 'package:demo_flutter/pages/remote_sales/order/widgets/rs_order_item.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class RsOrderPage extends StatefulWidget {
  const RsOrderPage({super.key});

  @override
  State<RsOrderPage> createState() => _RsOrderPageState();
}

class _RsOrderPageState extends State<RsOrderPage> {
  List<RsOrderModel> _rsOrders = [];
  List<RsOrderModel> _searchOrders = [];

  @override
  void initState() {
    super.initState();
    _rsOrders = rsOrders;
    _searchOrders = _rsOrders;
  }

  void _search(String searchText) {
    searchText = searchText.toLowerCase();
    _searchOrders = _rsOrders
        .where((e) => (e.id ?? '').toLowerCase().contains(searchText))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF2F2FF,
      appBar: const HiBossAppBar(
        leftIcon: 'assets/icons/ic_refresh.svg',
        title: 'Đơn hàng nội bộ',
        rightIcon: 'assets/icons/ic_add.svg',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HiBossSearchBox(
            onChange: _search,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0).copyWith(left: 20.0),
            child: Text(
              '11 July, 2021',
              style: AppStyle.h20w600.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _searchOrders.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final order = _searchOrders[index];
                return RsOrderItem(order: order);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12.0),
            ),
          )
        ],
      ),
    );
  }
}
