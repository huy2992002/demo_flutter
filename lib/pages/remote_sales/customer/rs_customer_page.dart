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
  List<CustomerModel> _rsCustomers = [];
  List<CustomerModel> _searchCustomer = [];

  @override
  void initState() {
    super.initState();
    _rsCustomers = rsCustomers;
    _searchCustomer = _rsCustomers;
  }

  void _search(String searchText) {
    searchText = searchText.toLowerCase();
    _searchCustomer = _rsCustomers
        .where((e) => (e.name ?? '').toLowerCase().contains(searchText))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColor.hF6F8FF,
        appBar: const HiBossAppBar(
          leftIcon: 'assets/icons/ic_refresh.svg',
          title: 'Quản lý khách hàng nội bộ',
          rightIcon: 'assets/icons/ic_add.svg',
        ),
        body: Column(
          children: [
            HiBossSearchBox(
              onChange: _search,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: _searchCustomer.length,
                itemBuilder: (context, index) {
                  final customer = _searchCustomer[index];
                  return RsCustomerItem(customer: customer);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
