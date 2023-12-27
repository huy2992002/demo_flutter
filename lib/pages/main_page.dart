import 'package:demo_flutter/pages/remote_sales/customer/rs_customer_page.dart';
import 'package:demo_flutter/pages/remote_sales/group/rs_group_page.dart';
import 'package:demo_flutter/pages/remote_sales/home/rs_home_page.dart';
import 'package:demo_flutter/pages/remote_sales/order/rs_order_page.dart';
import 'package:demo_flutter/pages/remote_sales/product/rs_product_page.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<String> mainIcons = [
    'assets/icons/ic_home.svg',
    'assets/icons/ic_bag.svg',
    'assets/icons/ic_user.svg',
    'assets/icons/ic_group.svg',
    'assets/icons/ic_paper.svg',
  ];

  List<String> mainTitles = [
    'Trang chủ',
    'Sản phẩm',
    'Khách hàng',
    'Đội nhóm',
    'Đơn hàng',
  ];

  List<Widget> pages = [
    const RsHomePage(),
    const RsProductPage(),
    const RsCustomerPage(),
    const RsGroupPage(),
    const RsOrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: _buildBottomNavigatorBar(),
    );
  }

  Container _buildBottomNavigatorBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 3.0),
            blurRadius: 7.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            mainIcons.length,
            (index) => Expanded(
              child: SizedBox(
                child: InkWell(
                  onTap: () => setState(() => currentIndex = index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? AppColor.h065986
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SvgPicture.asset(
                        mainIcons[index],
                        // ignore: deprecated_member_use
                        color: currentIndex == index
                            ? AppColor.h065986
                            : AppColor.h48484A,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        mainTitles[index],
                        style: AppStyle.h11w600.copyWith(
                          color: currentIndex == index
                              ? AppColor.h065986
                              : AppColor.h48484A,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
