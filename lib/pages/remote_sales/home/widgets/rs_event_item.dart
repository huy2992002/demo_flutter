import 'package:demo_flutter/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter/models/event_model.dart';
import 'package:demo_flutter/resources/app_color.dart';
import 'package:demo_flutter/resources/app_style.dart';

class RsEventItem extends StatelessWidget {
  const RsEventItem({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  event.title ?? '',
                  style: AppStyle.h14w600,
                ),
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
  }
}
