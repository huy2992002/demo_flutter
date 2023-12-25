import 'package:demo_flutter/models/enterprise_model.dart';
import 'package:demo_flutter/models/rs_pr_category_model.dart';
import 'package:demo_flutter/models/rs_product_detail_model.dart';

class RsProductModel {
  String? id;
  String? name;
  String? background;
  double? price;
  double? priceSale;
  String? unit;
  int? sole;
  bool? isSave;
  List<RsPrCategoryModel>? categories;
  RsProductDetailModel? detail;
  bool? isSelectCart;
  String? createOrderAt;
  EnterpriseModel? enterprise;

  RsProductModel();
}

List<RsProductModel> rsProducts = [
  RsProductModel()
    ..id = '1113'
    ..name = 'Khoá Toán tư duy tiền tiểu học'
    ..background = 'assets/images/img_rs_product_1.png'
    ..price = 600000
    ..priceSale = 549000
    ..unit = 'K'
    ..sole = 12
    ..isSave = true
    ..categories = [
      rsPrCategories[0],
      rsPrCategories[2],
      rsPrCategories[4],
    ]
    ..detail = rsProductDetails[0]
    ..enterprise = enterprises[0],
  RsProductModel()
    ..id = '2231'
    ..name = 'Học toán cùng cây thước Bkids'
    ..background = 'assets/images/img_rs_product_2.png'
    ..price = 369000
    ..priceSale = 329000
    ..unit = 'Kg'
    ..sole = 79
    ..isSave = true
    ..categories = [
      rsPrCategories[1],
      rsPrCategories[3],
      rsPrCategories[4],
    ]
    ..detail = rsProductDetails[1]
    ..enterprise = enterprises[1],

  RsProductModel()
    ..id = '3863'
    ..name = 'Hành trang vào lớp 1'
    ..background = 'assets/images/img_rs_product_3.png'
    ..priceSale = 499000
    ..unit = 'K'
    ..sole = 12
    ..isSave = false
    ..categories = [
      rsPrCategories[0],
      rsPrCategories[2],
      rsPrCategories[5],
    ]
    ..detail = rsProductDetails[2]
    ..enterprise = enterprises[2],

  RsProductModel()
    ..id = '4653'
    ..name = 'Chinh phục quốc kỳ - Cùng bé học lá cờ của các Quốc gia'
    ..background = 'assets/images/img_rs_product_4.png'
    ..priceSale = 339000
    ..unit = 'K'
    ..sole = 12
    ..isSave = true
    ..categories = [
      rsPrCategories[1],
      rsPrCategories[3],
      rsPrCategories[5],
    ]
    ..detail = rsProductDetails[3]
    ..enterprise = enterprises[3],

  RsProductModel()
    ..id = '5612'
    ..name = 'Chinh phục Quốc kỳ CĐ2'
    ..background = 'assets/images/img_rs_product_5.png'
    ..price = 429000
    ..priceSale = 399000
    ..unit = 'K'
    ..sole = 12
    ..isSave = true
    ..categories = [
      rsPrCategories[0],
      rsPrCategories[1],
      rsPrCategories[4],
    ]
    ..detail = rsProductDetails[4]
    ..enterprise = enterprises[4],

  RsProductModel()
    ..id = '6877'
    ..name = 'Toán tư duy Vinabacus'
    ..background = 'assets/images/img_rs_product_6.png'
    ..price = 459000
    ..priceSale = 399000
    ..unit = 'Kg'
    ..sole = 12
    ..isSave = false
    ..categories = [
      rsPrCategories[1],
      rsPrCategories[4],
      rsPrCategories[5],
    ]
    ..detail = rsProductDetails[5]
    ..enterprise = enterprises[4],

];

List<RsProductModel> cartRsProducts = [
  rsProducts[2]..isSelectCart = false,
  rsProducts[3]..isSelectCart = false,
  rsProducts[1]..isSelectCart = false,
];
