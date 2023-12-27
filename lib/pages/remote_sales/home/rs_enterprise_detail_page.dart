import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/enterprise_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class RsEnterpriseDetailPage extends StatelessWidget {
  const RsEnterpriseDetailPage({
    super.key,
    required this.enterprise,
  });

  final EnterpriseModel enterprise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF6F8FF,
      appBar: HiBossAppBar(
        leftIcon: 'assets/icons/ic_back.svg',
        leftPressed: () => Navigator.pop(context),
        title: 'Chi tiết nhà cung cấp',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    enterprise.image ?? '',
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    enterprise.name ?? '',
                    style: AppStyle.h20w600.copyWith(color: Colors.black),
                  ),
                  _buildRowItem(
                    title: 'Lĩnh vực kinh doanh',
                    text: enterprise.businessAreas ?? '',
                  ),
                  _buildRowItem(
                    title: 'Website',
                    text: enterprise.website ?? '',
                  ),
                  _buildRowItem(
                    title: 'Địa chỉ',
                    text: enterprise.address ?? '',
                  ),
                  _buildRowItem(
                    title: 'Mô tả',
                    text: enterprise.description ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildRowItem(
      {required String title, required String text, double? space}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyle.h14w400),
          SizedBox(width: space ?? 30.0),
          Expanded(
            child: Text(
              text,
              style: AppStyle.h14w500.copyWith(color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
