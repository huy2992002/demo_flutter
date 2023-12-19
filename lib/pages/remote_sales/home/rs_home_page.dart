import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_flutter/models/event_model.dart';
import 'package:demo_flutter/models/user_model.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_appbar_home.dart';
import 'package:demo_flutter/pages/remote_sales/profile/user_detail_page.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:demo_flutter/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsHomePage extends StatefulWidget {
  const RsHomePage({super.key});

  @override
  State<RsHomePage> createState() => _RsHomePageState();
}

class _RsHomePageState extends State<RsHomePage> {
  List<String> categoryIcons = [
    'assets/icons/ic_bar_chart.svg',
    'assets/icons/ic_new.svg',
    'assets/icons/ic_mortgage.svg',
    'assets/icons/ic_warranty.svg',
    'assets/icons/ic_shopping_cart.svg',
    'assets/icons/ic_shopping_bag.svg',
  ];

  List<String> categoryTitles = [
    'Bán chạy',
    'Mới',
    'Hoa hồng cao',
    'Phổ biến',
    'Dễ bán',
    'Khuyến mãi',
  ];

  List<String> supplierImgs = [
    'assets/images/img_logo_squeegee.png',
    'assets/images/img_logo_beekids.png',
    'assets/images/img_logo_mnpedu.png',
  ];

  List<String> supplierTitles = [
    'Công ty Giáo dục Tân Kỷ Nguyên',
    'Ứng dụng giáo dục Beekids',
    'Công ty Giáo dục MNP',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hF6F8FF,
      appBar: RsAppbarHome(
        user: user1,
        onProfile: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailPage(
                user: user1,
              ),
            ),
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0)
            .copyWith(top: 16.0, bottom: 70.0),
        children: [
          Image.asset('assets/images/img_background_pr.png'),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh mục gợi ý bán hàng',
                  style: AppStyle.h16w600.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 207,
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SvgPicture.asset(categoryIcons[index]),
                          const SizedBox(height: 6.0),
                          Text(
                            categoryTitles[index],
                            style: AppStyle.h14w600,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhà cung cấp nổi bật',
                  style: AppStyle.h16w600.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    options: CarouselOptions(
                      height: 140,
                      autoPlay: true,
                      viewportFraction: 0.45,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SizedBox(
                          width: 140,
                          height: 200,
                          child: Image.asset(
                            supplierImgs[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Xem tất cả',
                      style: AppStyle.h14w600.copyWith(color: AppColor.h063782),
                    ),
                    const SizedBox(width: 4.0),
                    SvgPicture.asset('assets/icons/ic_expand_more.svg')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sự kiện nổi bật',
                  style: AppStyle.h16w600.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.h48484A,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(event.avatar ?? ''),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(event.title ?? '',
                                      style: AppStyle.h14w600),
                                  const SizedBox(height: 12.0),
                                  Text(
                                    'Diễn ra từ ${event.dayStart.toDateTimeFormat()} - ${event.dayEnd.toDateTimeFormat()}',
                                    style: AppStyle.h10w400,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12.0),
                    itemCount: events.length),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Xem tất cả',
                      style: AppStyle.h14w600.copyWith(color: AppColor.h063782),
                    ),
                    const SizedBox(width: 4.0),
                    SvgPicture.asset('assets/icons/ic_expand_more.svg')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
