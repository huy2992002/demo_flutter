class EnterpriseModel {
  String? name;
  String? image;
  String? businessAreas;
  String? website;
  String? address;
  String? description;

  EnterpriseModel();
}

List<EnterpriseModel> enterprises = [
  EnterpriseModel()
    ..name = 'Ứng dụng giáo dục Beekids'
    ..description =
        'Nền tảng kết nối học tập và phát triển kỹ năng tư duy cho Trẻ 4 đến 10 tuổi. Là nơi Phụ Huynh và Giáo Viên an tâm chia sẻ các chương trình học và cuộc thi online dạng gamification đến Trẻ.'
    ..image = 'assets/images/img_logo_beekids.png'
    ..businessAreas = 'Sản phẩm giáo dục'
    ..website = 'www.beekids.edu.vn'
    ..address = '114 Hoàng Diệu, P. Bình Thuận, Q. Hải Châu, TP Đà Nẵng',
  EnterpriseModel()
    ..name = 'Công ty Giáo dục MNP'
    ..description = 'Công ty Giáo dục MNP'
    ..image = 'assets/images/img_logo_mnpedu.png'
    ..businessAreas = 'Sản phẩm giáo dục'
    ..website = 'www.npedu.edu.vn'
    ..address = '114 Hoàng Diệu, P. Bình Thuận, Q. Hải Châu, TP Đà Nẵng',
  EnterpriseModel()
    ..name = 'Công ty Giáo dục Tân Kỷ Nguyên'
    ..description = 'Công ty Giáo dục Tân Kỷ Nguyên'
    ..image = 'assets/images/img_logo_squeegee.png'
    ..businessAreas = 'Sản phẩm giáo dục'
    ..website = 'www.squeegee.edu.vn'
    ..address = '114 Hoàng Diệu, P. Bình Thuận, Q. Hải Châu, TP Đà Nẵng',
  EnterpriseModel()
    ..name = 'Công ty CP Giáo dục công nghệ Dragold'
    ..description = 'Công ty CP Giáo dục công nghệ Dragold'
    ..image = 'assets/images/img_logo_dragold.png'
    ..businessAreas = 'Sản phẩm giáo dục'
    ..website = 'www.dragold.edu.vn'
    ..address = '114 Hoàng Diệu, P. Bình Thuận, Q. Hải Châu, TP Đà Nẵng',
  EnterpriseModel()
    ..name = 'DOLPHIN'
    ..description = 'DOLPHIN'
    ..image = 'assets/images/img_logo_dolphin.png'
    ..businessAreas = 'Sản phẩm giáo dục'
    ..website = 'www.dolphin.edu.vn'
    ..address = '114 Hoàng Diệu, P. Bình Thuận, Q. Hải Châu, TP Đà Nẵng',
];
