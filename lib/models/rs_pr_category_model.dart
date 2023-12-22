class RsPrCategoryModel {
  String? name;
  String? logo;

  RsPrCategoryModel();
}

List<RsPrCategoryModel> rsPrCategories = [
  RsPrCategoryModel()
    ..name = 'Bán chạy'
    ..logo = 'assets/icons/ic_bar_chart.svg',
   RsPrCategoryModel()
    ..name = 'Mới'
    ..logo = 'assets/icons/ic_new.svg',
    RsPrCategoryModel()
    ..name = 'Hoa hồng cao'
    ..logo = 'assets/icons/ic_mortgage.svg',
    RsPrCategoryModel()
    ..name = 'Phổ biến'
    ..logo = 'assets/icons/ic_warranty.svg',
    RsPrCategoryModel()
    ..name = 'Dễ bán'
    ..logo = 'assets/icons/ic_shopping_cart.svg',
    RsPrCategoryModel()
    ..name = 'Khuyến mãi'
    ..logo = 'assets/icons/ic_shopping_bag.svg', 
];
