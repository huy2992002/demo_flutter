import 'package:demo_flutter/models/user_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsAppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const RsAppbarHome({
    super.key,
    required this.user,
    this.onProfile,
  });

  final UserModel user;
  final Function()? onProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).padding.top + 78,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_background_appbar.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            GestureDetector(
              onTap: onProfile,
              behavior: HitTestBehavior.translucent,
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(user.avatar ?? ''),
                        ),
                        border: Border.all(color: Colors.white, width: 2.0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name ?? '',
                          style: AppStyle.h15w700.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          (user.role ?? false)
                              ? 'Doanh nghiệp'
                              : 'Remote Sales',
                          style: AppStyle.h13w700.copyWith(
                            color: (user.role ?? false)
                                ? AppColor.h6CE9A6
                                : AppColor.hFEC84B,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/ic_qr_code.svg'),
            const SizedBox(width: 8.0),
            SvgPicture.asset('assets/icons/ic_bell.svg'),
            const SizedBox(width: 8.0),
            SvgPicture.asset('assets/icons/ic_buy.svg'),
            const SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
