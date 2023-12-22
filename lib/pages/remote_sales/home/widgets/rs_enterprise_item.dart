import 'package:demo_flutter/models/enterprise_model.dart';
import 'package:flutter/material.dart';

class RsEnterpriseItem extends StatelessWidget {
  const RsEnterpriseItem({
    super.key,
    required this.enterprise,
  });

  final EnterpriseModel enterprise;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: SizedBox(
        width: 140,
        height: 200,
        child: Image.asset(
          enterprise.image ?? '',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
