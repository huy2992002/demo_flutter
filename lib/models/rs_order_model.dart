class RsOrderModel {
  String? id;
  String? image;
  String? date;
  String? status;
  double? price;

  RsOrderModel();
}

List<RsOrderModel> rsOrders = [
  RsOrderModel()
    ..id = '12315412534'
    ..image = 'assets/images/img_order_1.png'
    ..date = '2023-02-10T10:55:35.065Z'
    ..status = 'Mới'
    ..price = 1040000,
    RsOrderModel()
    ..id = '12315412534'
    ..image = 'assets/images/img_order_2.png'
    ..date = '2023-02-10T10:55:35.065Z'
    ..status = 'Chờ xác nhận'
    ..price = 2340000,
    RsOrderModel()
    ..id = '12315412123'
    ..image = 'assets/images/img_order_2.png'
    ..date = '2023-02-10T10:55:35.065Z'
    ..status = 'Chờ xác nhận'
    ..price = 2340000,
    RsOrderModel()
    ..id = '12315412734'
    ..image = 'assets/images/img_order_3.png'
    ..date = '2023-02-10T10:55:35.065Z'
    ..status = 'Hoàn thành'
    ..price = 10240000,
    RsOrderModel()
    ..id = '12315412727'
    ..image = 'assets/images/img_order_3.png'
    ..date = '2023-02-10T10:55:35.065Z'
    ..status = 'Hoàn thành'
    ..price = 10240000,
    RsOrderModel()
    ..id = '123154129053'
    ..image = 'assets/images/img_order_4.png'
    ..date = '2023-02-10T10:55:35.065Z'
    ..status = 'Đã huỷ'
    ..price = 1040000,
];
