import 'package:flutter/material.dart';
import 'package:kubaby/app/config/colors.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColos : Color(0xffEBEBEB),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
