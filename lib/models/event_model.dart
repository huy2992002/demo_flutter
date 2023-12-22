class EventModel {
  String? avatar;
  String? title;
  String? dayStart;
  String? dayEnd;

  EventModel();
}

List<EventModel> events = [
  EventModel()
    ..avatar = 'assets/images/img_event_1.png'
    ..title = 'Mua khoá học Toán tư duy Quốc tế - Tặng ngay Khoá ôn'
    ..dayStart = '2023-05-11T10:55:35.065Z'
    ..dayEnd = '2023-05-11T02:03:48.467Z',
  EventModel()
    ..avatar = 'assets/images/img_event_2.png'
    ..title = 'Mua khoá học Toán tư duy Quốc tế - Tặng ngay Khoá ôn'
    ..dayStart = '2023-04-20T02:03:48.467Z'
    ..dayEnd = '2023-05-22T02:03:48.467Z',
  EventModel()
    ..avatar = 'assets/images/img_event_3.png'
    ..title = 'Mua khoá học Toán tư duy Quốc tế - Tặng ngay Khoá ôn'
    ..dayStart = '2023-04-17T02:03:48.467Z'
    ..dayEnd = '2023-05-20T02:03:48.467Z',
  EventModel()
    ..avatar = 'assets/images/img_event_4.png'
    ..title = 'Mua khoá học Toán tư duy Quốc tế - Tặng ngay Khoá ôn'
    ..dayStart = '2023-04-17T02:03:48.467Z'
    ..dayEnd = '2023-05-20T02:03:48.467Z',  
];
