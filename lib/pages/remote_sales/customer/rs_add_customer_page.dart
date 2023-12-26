import 'package:demo_flutter/components/button/hi_boss_elevated_button.dart';
import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/text_field/hi_boss_text_field.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsAddCustomerPage extends StatefulWidget {
  const RsAddCustomerPage({super.key});

  @override
  State<RsAddCustomerPage> createState() => _RsAddCustomerPageState();
}

class _RsAddCustomerPageState extends State<RsAddCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColor.hF2F2FF,
        appBar: HiBossAppBar(
          leftIcon: 'assets/icons/ic_back.svg',
          leftPressed: () => Navigator.pop(context),
          title: 'Tạo mới khách hàng',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      const HiBossTextField(
                        labelText: 'Tên khách hàng',
                        request: true,
                      ),
                      const SizedBox(height: 24.0),
                      const HiBossTextField(
                        labelText: 'Số điện thoại',
                        request: true,
                        hintText: '(+84)',
                      ),
                      const SizedBox(height: 24.0),
                      const HiBossTextField(
                        labelText: 'Email',
                        request: true,
                      ),
                      const SizedBox(height: 24.0),
                      _buildRowLabel(
                        text: 'Nhãn khách hàng',
                      ),
                      const SizedBox(height: 24.0),
                      const HiBossTextField(
                        labelText: 'Ghi chú',
                        request: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: HiBossTextField(
                    labelText: 'Thông tin nâng cao',
                    secondText: 'Xem',
                    hintText: 'Chưa có thông tin nâng cao',
                  ),
                ),
                SizedBox(height: 24.0),
                HiBossElevatedButton(
                  text: 'Áp dụng',
                  color: AppColor.h063782,
                  borderColor: AppColor.h063782,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowLabel({
    Function()? onPressed,
    required String text,
    String? label,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: AppStyle.h13w600.copyWith(
                    color: AppColor.h434343,
                  ),
                ),
              ),
              Text(
                label ?? 'Chưa có',
                style: AppStyle.h14w600.copyWith(
                  color: AppColor.hC1C1C7,
                ),
              ),
              const SizedBox(width: 8.0),
              SvgPicture.asset(
                'assets/icons/ic_arrow_right.svg',
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(
            thickness: 1.0,
            height: 1.0,
            color: AppColor.hE6E6E9,
          )
        ],
      ),
    );
  }
}
