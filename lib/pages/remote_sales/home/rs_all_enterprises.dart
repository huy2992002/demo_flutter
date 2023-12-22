import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/enterprise_model.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_all_enterprise_item.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

class RsAllEnterprise extends StatefulWidget {
  const RsAllEnterprise({super.key});

  @override
  State<RsAllEnterprise> createState() => _RsAllEnterpriseState();
}

class _RsAllEnterpriseState extends State<RsAllEnterprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF6F8FF,
      appBar: HiBossAppBar(
        leftIcon: 'assets/icons/ic_back.svg',
        leftPressed: () => Navigator.pop(context),
        title: 'Danh sách nhà cung cấp',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: enterprises.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            final enterprise = enterprises[index];
            return RsAllEnterpriseItem(enterprise: enterprise);
          },
        ),
      ),
    );
  }
}
