class UserModel {
  String? avatar;
  String? name;
  bool? role;

  UserModel();
}

UserModel user1 = UserModel()
  ..avatar = 'assets/images/img_user_1.png'
  ..name = 'Trần Văn Trung'
  ..role = false;
