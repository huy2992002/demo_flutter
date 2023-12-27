import 'package:demo_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

class CustomerModel {
  String? avatar;
  String? name;
  String? phone;
  List<Label>? labels;

  CustomerModel();
}

CustomerModel customer = CustomerModel()
  ..avatar = 'assets/images/img_customer.png'
  ..name = 'Nguyễn Thị Thu Hồi'
  ..phone = '(+84) 0909 332 332'
  ..labels = [
    Label()
      ..name = 'Mới'
      ..color = AppColor.hFFB3AF,
    Label()
      ..name = 'Phổ thông'
      ..color = AppColor.h90E6D7,
  ];

List<CustomerModel> rsCustomers = [
  CustomerModel()
    ..avatar = 'assets/images/img_customer_1.png'
    ..name = 'Nguyễn Thị An'
    ..phone = '(+84)909 122 889'
    ..labels = [
      Label()
        ..name = 'Mới'
        ..color = AppColor.hFFB3AF,
      Label()
        ..name = 'Phổ thông'
        ..color = AppColor.h90E6D7,
    ],
  CustomerModel()
    ..avatar = 'assets/images/img_customer_2.png'
    ..name = 'Đặng Ngọc Ân'
    ..phone = '(+84) 909 445 619'
    ..labels = [
      Label()
        ..name = 'Mới'
        ..color = AppColor.hFFB3AF,
    ],
  CustomerModel()
    ..avatar = 'assets/images/img_customer_3.png'
    ..name = 'Trần Nhật Anh'
    ..phone = '(+84)778 058 216'
    ..labels = [
      Label()
        ..name = 'Phổ thông'
        ..color = AppColor.h90E6D7,
    ],
  CustomerModel()
    ..avatar = 'assets/images/img_customer_4.png'
    ..name = 'Phạm Thị Bình'
    ..phone = '(+84)905 459 319'
    ..labels = [
      Label()
        ..name = 'Mới'
        ..color = AppColor.hFFB3AF,
      Label()
        ..name = 'Phổ thông'
        ..color = AppColor.h90E6D7,
    ],
  CustomerModel()
    ..avatar = 'assets/images/img_customer_5.png'
    ..name = 'Nguyễn Trình Bồng'
    ..phone = '(+84)977 120 456'
    ..labels = [
      Label()
        ..name = 'Phổ thông'
        ..color = AppColor.h90E6D7,
    ],
];

class Label {
  String? name;
  Color? color;
  bool? selected;

  Label();
}

List<Label> labels = [
  Label()
    ..name = 'Vip'
    ..color = AppColor.hFDE795
    ..selected = false,
  Label()
    ..name = 'Phổ thông'
    ..color = AppColor.h90E6D7
    ..selected = false,
  Label()
    ..name = 'Tiềm năng'
    ..color = AppColor.hA4D7F4
    ..selected = false,
  Label()
    ..name = 'Mới'
    ..color = AppColor.hFFB3AF
    ..selected = false,
];
