import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_flutter/models/enterprise_model.dart';
import 'package:demo_flutter/models/event_model.dart';
import 'package:demo_flutter/models/rs_pr_category_model.dart';
import 'package:demo_flutter/models/user_model.dart';
import 'package:demo_flutter/pages/remote_sales/home/rs_all_enterprises.dart';
import 'package:demo_flutter/pages/remote_sales/home/rs_all_events.dart';
import 'package:demo_flutter/pages/remote_sales/home/rs_category_detail_page.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_appbar_home.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_category_item.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_enterprise_item.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_event_item.dart';
import 'package:demo_flutter/pages/remote_sales/profile/user_detail_page.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsHomePage extends StatefulWidget {
  const RsHomePage({super.key});

  @override
  State<RsHomePage> createState() => _RsHomePageState();
}

class _RsHomePageState extends State<RsHomePage> {
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
                    itemCount: rsPrCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final rsPrCategorie = rsPrCategories[index];
                      return RsCategoryItem(
                        rsPrCategorie: rsPrCategorie,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RsCategoryDetailPage(
                                category: rsPrCategorie.name ?? '',
                              ),
                            ),
                          );
                        },
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
                      final enterprise = enterprises[index];
                      return RsEnterpriseItem(enterprise: enterprise);
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                _buildViewAllButton(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RsAllEnterprise(),
                      ),
                    );
                  },
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return RsEventItem(event: event);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12.0),
                ),
                const SizedBox(height: 12.0),
                _buildViewAllButton(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RsAllEvents(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildViewAllButton(BuildContext context, {Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Text(
            'Xem tất cả',
            style: AppStyle.h14w600.copyWith(
              color: AppColor.h063782,
            ),
          ),
        ),
        const SizedBox(width: 4.0),
        SvgPicture.asset('assets/icons/ic_expand_more.svg')
      ],
    );
  }
}
