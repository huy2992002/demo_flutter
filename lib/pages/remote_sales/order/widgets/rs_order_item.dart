import 'package:demo_flutter/models/rs_order_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:demo_flutter/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RsOrderItem extends StatelessWidget {
  const RsOrderItem({
    super.key,
    required this.order,
  });

  final RsOrderModel order;

  @override
  Widget build(BuildContext context) {
    List<Color> checkColor(String status) {
      if (status == 'Mới') {
        return [AppColor.hFEF0C7, AppColor.hF79009];
      } else if (status == 'Chờ xác nhận') {
        return [AppColor.hE0F2FE, AppColor.h4C7CF6];
      } else if (status == 'Hoàn thành') {
        return [AppColor.hD1FADF, AppColor.h12B76A];
      } else {
        return [AppColor.hEDEDF2, AppColor.h949499];
      }
    }

    return Container(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6.0,
            height: 17.0,
            margin: const EdgeInsets.only(top: 4.0),
            decoration: BoxDecoration(
              color: checkColor(order.status ?? '')[1],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(3.5),
                bottomRight: Radius.circular(3.5),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Image.asset(
            order.image ?? '',
            width: 72,
            height: 72.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('#${order.id}', style: AppStyle.h14w700),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/ic_calendar.svg'),
                      const SizedBox(width: 8.0),
                      Text(
                        (order.date ?? '').toDateTimeFormat(),
                        style: AppStyle.h12w500.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: checkColor(order.status ?? '')[0],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        order.status ?? 'Mới',
                        style: AppStyle.h14w600.copyWith(
                          color: checkColor(order.status ?? '')[1],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      (order.price ?? 0.0).toVnd(),
                      style: AppStyle.h16w600.copyWith(color: AppColor.hF04438),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
