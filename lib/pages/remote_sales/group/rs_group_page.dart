import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/rs_group_model.dart';
import 'package:demo_flutter/pages/remote_sales/group/widgets/rs_group_item.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';

class RsGroupPage extends StatefulWidget {
  const RsGroupPage({super.key});

  @override
  State<RsGroupPage> createState() => _RsGroupPageState();
}

class _RsGroupPageState extends State<RsGroupPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.hF6F8FF,
        appBar: const HiBossAppBar(
          title: 'Nhóm bán hàng',
          rightIcon: 'assets/icons/ic_add.svg',
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                controller: _tabController,
                labelStyle: AppStyle.h14w500,
                labelColor: AppColor.h063782,
                unselectedLabelColor: AppColor.h949499,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.0,
                indicatorColor: AppColor.h063782,
                tabs: const [
                  Tab(text: 'Danh sách nhóm'),
                  Tab(text: 'Nhóm của tôi'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: rsGroups.length,
                    itemBuilder: (context, index) {
                      final group = rsGroups[index];
                      return RsGroupItem(group: group);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: rsGroups
                        .where((element) => element.isMe == true)
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      final group = rsGroups
                          .where((element) => element.isMe == true)
                          .toList()[index];
                      return RsGroupItem(group: group);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
