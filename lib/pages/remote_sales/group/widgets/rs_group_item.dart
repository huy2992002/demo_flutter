import 'package:demo_flutter/models/rs_group_model.dart';
import 'package:demo_flutter/resources/app_style.dart';
import 'package:demo_flutter/utils/app_extension.dart';
import 'package:flutter/material.dart';

class RsGroupItem extends StatelessWidget {
  const RsGroupItem({
    super.key,
    required this.group,
  });

  final RsGroupModel group;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          Image.asset(group.image ?? ''),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.name ?? '',
                style: AppStyle.h15w600.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 4.0),
              _buildDoubleText(
                title: 'Trưởng nhóm:',
                text: group.leaderName ?? '',
              ),
              _buildDoubleText(title: 'Thành viên:', text: '${group.members}'),
              _buildDoubleText(
                  title: 'Doanh số:', text: (group.revenue ?? 0.0).toVnd()),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildDoubleText({required String title, required String text}) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyle.h13w400.copyWith(color: Colors.grey),
        ),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: AppStyle.h13w600.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
