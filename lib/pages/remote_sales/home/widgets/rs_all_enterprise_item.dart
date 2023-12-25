import 'package:demo_flutter/models/enterprise_model.dart';
import 'package:flutter/material.dart';

class RsAllEnterpriseItem extends StatelessWidget {
  const RsAllEnterpriseItem({
    super.key,
    required this.enterprise,
    this.onPressed,
  });

  final EnterpriseModel enterprise;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Image.asset(
              enterprise.image ?? '',
              width: 95.0,
              height: 90.0,
            ),
            const SizedBox(height: 5.0),
            Text(
              enterprise.name ?? '',
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
