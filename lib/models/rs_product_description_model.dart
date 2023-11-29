class RsProductDescriptionModel {
  String? fit;
  String? description;
  String? route;
  List<String>? stepsRoute;
  String? difference;
  List<String>? benefits;

  RsProductDescriptionModel();
}

RsProductDescriptionModel rsPDescription = RsProductDescriptionModel()
  ..fit = 'Dành cho bé từ 4 - 6 tuổi'
  ..description =
      'Chương trình 36 Tuần phát triển tư duy Toán cho bé hoàn chỉnh được các kỹ năng quan sát, ghi nhớ, suy luận, tư duy logic và số học. Bên cạnh đó, khóa học còn giúp bé đến với Toán một cách tự nhiên và vui thích để ham học hỏi, tìm tòi hơn.'
  ..route =
      'Khóa học gồm 9 tháng và chia ra 3 Giai Đoạn, mỗi Giai Đoạn có 3 tháng. Trong đó 1 tháng bé được luyện tập theo lộ trình tuần và học 3 buổi/tuần, 20-30 phút/ngày. Sau đó, bé sẽ được tham gia bài test để đánh giá năng lực của mình và chuyển qua giai đoạn nâng cấp trình độ của khóa học.'
  ..stepsRoute = [
    'Khởi động',
    'Tăng tốc',
    'Về đích',
  ]
  ..difference =
      '''Với “36 tuần phát triển toàn diện tư duy Toán cho bé”, khóa học sẽ mang đến cho các con trải nghiệm học tập hoàn hảo thông qua “Học - thực hành - công nghệ”. Khóa học gồm 9 tháng và chia ra 3 Giai Đoạn, mỗi Giai Đoạn có 3 tháng. Sau đó, bé sẽ được tham gia bài test để đánh giá năng lực của mình và chuyển qua giai đoạn nâng cấp trình độ của khóa học. Đặc biệt, tiết kiệm đến 95% chi phí so với khóa học Offline. '''
  ..benefits = [
    'Kỹ năng Quan sát',
    'Kỹ năng Ghi nhớ',
    'Kỹ năng Suy luận',
    'Kỹ năng Logic',
    'Kỹ năng Số học ',
  ];
