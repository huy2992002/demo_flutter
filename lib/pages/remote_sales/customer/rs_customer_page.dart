import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/text_field/hi_boss_search_box.dart';
import 'package:demo_flutter/models/customer_model.dart';
import 'package:demo_flutter/pages/remote_sales/customer/widgets/rs_custumer_item.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

class RsCustomerPage extends StatefulWidget {
  const RsCustomerPage({super.key});

  @override
  State<RsCustomerPage> createState() => _RsCustomerPageState();
}

class _RsCustomerPageState extends State<RsCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF6F8FF,
      appBar: const HiBossAppBar(
        leftIcon: 'assets/icons/ic_refresh.svg',
        title: 'Quản lý khách hàng nội bộ',
        rightIcon: 'assets/icons/ic_add.svg',
      ),
      body: ListView(
        children: [
          const HiBossSearchBox(),
          ListView.separated(
            padding: const EdgeInsets.all(16.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rsCustomers.length,
            itemBuilder: (context, index) {
              final customer = rsCustomers[index];
              return RsCustomerItem(customer: customer);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12.0),
          ),
        ],
      ),
    );
  }
}

