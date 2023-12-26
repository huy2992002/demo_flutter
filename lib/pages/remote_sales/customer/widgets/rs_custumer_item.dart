import 'package:demo_flutter/models/customer_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class RsCustomerItem extends StatelessWidget {
  const RsCustomerItem({
    super.key,
    required this.customer,
  });

  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
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
                          color:
                              customer.labels?[index].color ?? AppColor.hFFB3AF,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        customer.labels?[index].name ?? '',
                        style: AppStyle.h12w600
                            .copyWith(color: customer.labels?[index].color),
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
  }
}
