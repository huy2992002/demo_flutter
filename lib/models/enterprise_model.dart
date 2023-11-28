class EnterpriseModel {
  String? name;
  String? image;
  String? website;
  String? address;

  EnterpriseModel();
}

List<EnterpriseModel> enterprises = [
  EnterpriseModel()
    ..name = 'Beekids'
    ..image = 'assets/images/img_logo_beekids.png'
    ..website = 'www.beekids.edu.vn'
    ..address = '114 Hoàng Diệu, P. Bình Thuận, Q. Hải Châu, TP Đà Nẵng',
];
