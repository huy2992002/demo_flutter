import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/user_model.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/user_social_item.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HiBossAppBar(
        leftIcon: 'assets/icons/ic_back.svg',
        leftPressed: () => Navigator.pop(context),
        title: 'Thông tin chi tiết',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      AppColor.h80B7EE,
                      AppColor.hD5E9F4,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.h4C4E64,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_circle_avatar.svg',
                          width: 100.0,
                        ),
                        Positioned(
                          top: 4.0,
                          left: 4.0,
                          right: 4.0,
                          bottom: 4.0,
                          child: SvgPicture.asset(
                            'assets/icons/ic_circle_avatar_small.svg',
                          ),
                        ),
                        Positioned(
                          top: 6.0,
                          left: 6.0,
                          right: 6.0,
                          bottom: 6.0,
                          child: Image.asset(
                            widget.user.avatar ?? '',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.user.name ?? '',
                      style: AppStyle.h18w500.copyWith(
                        color: AppColor.h4C4E64.withOpacity(0.87),
                      ),
                    ),
                    Text(
                      widget.user.detail?.position ?? '',
                      style: AppStyle.h14w600.copyWith(
                        color: AppColor.h4C4E64.withOpacity(0.87),
                      ),
                    ),
                    Text(
                      widget.user.detail?.company ?? '',
                      style: AppStyle.h14w400,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      AppColor.h2758A0,
                      AppColor.h5F80B0,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.h4C4E64,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: ListView.separated(
                  itemCount: widget.user.detail?.informations?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = widget.user.detail?.informations?[index];
                    return UserSocialItem(
                      item: item,
                      onPressed: () {
                        setState(() {
                          item?.status = !(item.status ?? false);
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
