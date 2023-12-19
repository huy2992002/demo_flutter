import 'package:demo_flutter/models/user_infomation_model.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserSocialItem extends StatelessWidget {
  const UserSocialItem({
    super.key,
    required this.item,
    this.onPressed,
  });

  final UserInfomationModel? item;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Row(
        children: [
          SvgPicture.asset(
            item?.icon ?? '',
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.name ?? '',
                  style: AppStyle.h12w400.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  (item?.status ?? false) ? item?.content ?? '' : '***********',
                  style: AppStyle.h14w600.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              (item?.status ?? false) ? 'Ẩn' : ' Hiển Thị',
              style: AppStyle.h14w600.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
