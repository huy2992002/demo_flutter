import 'package:demo_flutter/models/enterprise_model.dart';

import 'rs_product_description_model.dart';
import 'rs_product_user_manual_model.dart';

class RsProductDetailModel {
  List<String>? images;
  int? commissionReceived;
  EnterpriseModel? enterprise;
  RsProductDescriptionModel? description;
  RsProductUserManualModel? userManual;

  RsProductDetailModel();
}

List<RsProductDetailModel> rsProductDetails = [
  RsProductDetailModel()
    ..images = [
      'assets/images/img_rs_product_1.png',
      'assets/images/img_rs_product_1.png',
      'assets/images/img_rs_product_1.png',
    ]
    ..commissionReceived = 10
    ..enterprise = enterprises[0]
    ..description = rsPDescription
    ..userManual = rsPUserManual,
  RsProductDetailModel()
    ..images = [
      'assets/images/img_rs_product_2.png',
      'assets/images/img_rs_product_2.png',
    ]
    ..commissionReceived = 12
    ..enterprise = enterprises[0]
    ..description = rsPDescription
    ..userManual = rsPUserManual,
  RsProductDetailModel()
    ..images = [
      'assets/images/img_rs_product_3.png',
      'assets/images/img_rs_product_3.png',
    ]
    ..commissionReceived = 13
    ..enterprise = enterprises[0]
    ..description = rsPDescription
    ..userManual = rsPUserManual,
  RsProductDetailModel()
    ..images = [
      'assets/images/img_rs_product_4.png',
      'assets/images/img_rs_product_4.png',
    ]
    ..commissionReceived = 14
    ..enterprise = enterprises[0]
    ..description = rsPDescription
    ..userManual = rsPUserManual,
  RsProductDetailModel()
    ..images = [
      'assets/images/img_rs_product_5.png',
      'assets/images/img_rs_product_5.png',
    ]
    ..commissionReceived = 10
    ..enterprise = enterprises[0]
    ..description = rsPDescription
    ..userManual = rsPUserManual,
  RsProductDetailModel()
    ..images = [
      'assets/images/img_rs_product_6.png',
      'assets/images/img_rs_product_6.png',
    ]
    ..commissionReceived = 10
    ..enterprise = enterprises[0]
    ..description = rsPDescription
    ..userManual = rsPUserManual,
];
