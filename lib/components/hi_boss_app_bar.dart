import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HiBossAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HiBossAppBar({
    super.key,
    this.leftPressed,
    this.rightPressed,
    this.leftIcon,
    this.rightIcon,
    required this.title,
  });

  final Function()? leftPressed;
  final Function()? rightPressed;
  final String? leftIcon;
  final String? rightIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img_background_appbar.png'),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
            top: MediaQuery.of(context).padding.top + 16, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftIcon != null
                ? GestureDetector(
                    onTap: leftPressed,
                    child: SvgPicture.asset(
                      leftIcon!,
                    ),
                  )
                : const SizedBox(width: 22.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            rightIcon != null
                ? GestureDetector(
                    onTap: rightPressed,
                    child: SvgPicture.asset(
                      rightIcon!,
                    ),
                  )
                : const SizedBox(width: 22.0),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
