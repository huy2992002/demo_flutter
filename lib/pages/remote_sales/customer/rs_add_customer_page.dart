import 'package:demo_flutter/components/button/hi_boss_elevated_button.dart';
import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/components/text_field/hi_boss_text_field.dart';
import 'package:demo_flutter/models/customer_model.dart';
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
  List<Label> selectLabels = [];

  void _addCustomer() {}

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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      GestureDetector(
                        onTap: () {
                          buildBottomSheetCus(
                            context,
                            callback: () => setState(() {}),
                          );
                        },
                        child: selectLabels.isEmpty
                            ? _buildRowLabel(
                                text: 'Nhãn khách hàng',
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Nhãn khách hàng:   ',
                                      style: AppStyle.h13w600.copyWith(
                                        color: AppColor.h434343,
                                      ),
                                    ),
                                    ...List.generate(
                                      selectLabels.length,
                                      (index) {
                                        final label = selectLabels[index];
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(right: 4.0),
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  label.color ?? Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Text(
                                            label.name ?? '',
                                            style: AppStyle.h12w400
                                                .copyWith(color: label.color),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const HiBossTextField(
                    labelText: 'Thông tin nâng cao',
                    secondText: 'Xem',
                    hintText: 'Chưa có thông tin nâng cao',
                  ),
                ),
                const SizedBox(height: 24.0),
                HiBossElevatedButton(
                  onPressed: _addCustomer,
                  text: 'Áp dụng',
                  color: AppColor.h063782,
                  radius: 20.0,
                  borderColor: AppColor.h063782,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildBottomSheetCus(BuildContext context,
      {Function()? callback}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.only(top: 8.0),
              height: 450,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: AppColor.hC1C1C7,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 68,
                      ),
                      Text(
                        'Nhãn',
                        style: AppStyle.h13w600.copyWith(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          for (Label label in labels) {
                            label.selected = true;
                            if (label.selected ?? false) {
                              selectLabels.add(label);
                            } else {
                              selectLabels.remove(label);
                            }
                          }
                          callback?.call();
                          setState(() {});
                        },
                        child: Text(
                          'Chọn tất cả',
                          style: AppStyle.h13w500.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                    color: AppColor.hDDDDE5,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 24.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: labels.length,
                    itemBuilder: (context, index) {
                      final label = labels[index];
                      return _buildLabelBottomSheet(
                        label,
                        onPressed: () {
                          label.selected = !(label.selected ?? false);
                          if (label.selected ?? false) {
                            selectLabels.add(label);
                          } else {
                            selectLabels.remove(label);
                          }
                          callback?.call();
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12.0),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0)
                        .copyWith(bottom: 24.0),
                    child: const HiBossElevatedButton(
                      text: 'Áp dụng',
                      radius: 20.0,
                      color: AppColor.h063782,
                      borderColor: AppColor.h063782,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Container _buildLabelBottomSheet(Label label, {Function()? onPressed}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: label.color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Text(
            label.name ?? '',
            style: AppStyle.h14w600,
          ),
          const Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: SvgPicture.asset(
              (label.selected ?? false)
                  ? 'assets/icons/ic_check_box.svg'
                  : 'assets/icons/ic_check_box_outline_blank.svg',
              // ignore: deprecated_member_use
              color: AppColor.h274CAC,
            ),
          ),
        ],
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
          ),
        ],
      ),
    );
  }
}
