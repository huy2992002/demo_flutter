import 'package:demo_flutter/models/user_detail_model.dart';

class UserModel {
  String? avatar;
  String? name;
  bool? role;
  UserDetailModel? detail;

  UserModel();
}

UserModel user1 = UserModel()
  ..avatar = 'assets/images/img_user_1.png'
  ..name = 'Trần Văn Trung'
  ..role = false
  ..detail = (UserDetailModel()
    ..position = 'CEO/ Founder'
    ..company = 'Công ty Cổ phần Giải pháp Công nghệ HifivePLUS'
    ..phone = '0905 550 123'
    ..phoneCompany = '0905 550 123'
    ..email = 'trantran@gmail.com'
    ..website = 'hifiveplus.com.vn'
    ..facebook = 'Trần Văn Trung'
    ..zalo = '0905 550 123');
