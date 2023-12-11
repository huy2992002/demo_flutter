import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HiBossSearchBox extends StatelessWidget {
  const HiBossSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 18.0,
          ),
          hintText: 'Tìm kiếm ...',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: SvgPicture.asset(
            'assets/icons/ic_menu_search.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
