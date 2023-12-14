class RsGroupModel {
  String? image;
  String? name;
  String? leaderName;
  int? members;
  double? revenue;
  bool? isMe;

  RsGroupModel();
}

List<RsGroupModel> rsGroups = [
  RsGroupModel()
    ..image = 'assets/images/img_rs_group_1.png'
    ..name = 'Nhóm Saler Khoá học'
    ..leaderName = 'Huỳnh Tất Phát'
    ..members = 24
    ..revenue = 12252000
    ..isMe = true,
  RsGroupModel()
    ..image = 'assets/images/img_rs_group_2.png'
    ..name = 'Nhóm Saler Khoá học'
    ..leaderName = 'Huỳnh Tất Phát'
    ..members = 24
    ..revenue = 11252000,
  RsGroupModel()
    ..image = 'assets/images/img_rs_group_3.png'
    ..name = 'Nhóm Saler Khoá học'
    ..leaderName = 'Huỳnh Tất Phát'
    ..members = 24
    ..revenue = 8252000
    ..isMe = true,
  RsGroupModel()
    ..image = 'assets/images/img_rs_group_4.png'
    ..name = 'Nhóm Saler Khoá học'
    ..leaderName = 'Huỳnh Tất Phát'
    ..members = 24
    ..revenue = 6252000,
  RsGroupModel()
    ..image = 'assets/images/img_rs_group_5.png'
    ..name = 'Nhóm Saler Khoá học'
    ..leaderName = 'Huỳnh Tất Phát'
    ..members = 24
    ..revenue = 12252000,
];
