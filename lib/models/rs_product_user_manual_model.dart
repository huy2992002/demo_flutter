class RsProductUserManualModel {
  String? text;
  List<String>? steps;

  RsProductUserManualModel();
}

RsProductUserManualModel rsPUserManual = RsProductUserManualModel()
  ..text =
      "Bạn cần cập nhập thông tin của bé trong ứng dụng đúng với thông tin đã đăng ký. Cập nhập thông tin của bé theo các bước dưới đây."
  ..steps = [
    'Vào góc phụ huynh',
    'Nhập số để xác nhận',
    'Chọn thông tin bé cần cập nhật thông tin',
    'Thay đổi thông tin tài khoản.',
    'Thay đổi và cập nhật thông tin của bé',
  ];
