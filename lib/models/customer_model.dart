class CustomerModel {
  String? avatar;
  String? name;
  String? phone;
  int? lable;

  CustomerModel();
}

CustomerModel customer = CustomerModel()
  ..avatar = 'assets/images/img_customer.png'
  ..name = 'Nguyễn Thị Thu Hồi'
  ..phone = '(+84) 0909 332 332'
  ..lable = 2;
