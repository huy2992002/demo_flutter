import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/text_field/hi_boss_search_box.dart';
import 'package:demo_flutter/models/customer_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
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
              return Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  children: [
                    Image.asset(customer.avatar ?? ''),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customer.name ?? '',
                          style: AppStyle.h15w600.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 4.0),
                        Text(customer.phone ?? '', style: AppStyle.h13w400),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            ...List.generate(
                              customer.labels?.length ?? 0,
                              (index) => Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: customer.labels?[index].color ??
                                        AppColor.hFFB3AF,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  customer.labels?[index].name ?? '',
                                  style: AppStyle.h12w600.copyWith(
                                      color: customer.labels?[index].color),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12.0),
          ),
        ],
      ),
    );
  }
}
