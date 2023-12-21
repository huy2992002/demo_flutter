import 'package:demo_flutter/models/user_detail_model.dart';
import 'package:demo_flutter/models/user_infomation_model.dart';

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
    ..informations = [
      UserInfomationModel()
        ..name = 'Số điện thoại'
        ..icon = 'assets/icons/ic_phone.svg'
        ..content = '0905 550 123'
        ..status = true,
      UserInfomationModel()
        ..name = 'Số điện thoại Công Ty'
        ..icon = 'assets/icons/ic_building_house.svg'
        ..content = '0905 550 123'
        ..status = true,
      UserInfomationModel()
        ..name = 'Email'
        ..icon = 'assets/icons/ic_mail.svg'
        ..content = 'trantran@gmail.com'
        ..status = true,
      UserInfomationModel()
        ..name = 'Website'
        ..icon = 'assets/icons/ic_website.svg'
        ..content = 'hifiveplus.com.vn'
        ..status = true,
      UserInfomationModel()
        ..name = 'Facebook'
        ..icon = 'assets/icons/ic_facebook.svg'
        ..content = 'Trần Văn Trung'
        ..status = true,
      UserInfomationModel()
        ..name = 'Zalo'
        ..icon = 'assets/icons/ic_zalo.svg'
        ..content = 'Trần Văn Trung'
        ..status = true,
    ]);
