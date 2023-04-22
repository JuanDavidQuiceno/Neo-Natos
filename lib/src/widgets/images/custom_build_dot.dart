import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class CustomBuildDot extends StatelessWidget {
  final int index;
  final int currentPage;
  final Color? color;
  const CustomBuildDot(
      {Key? key, required this.index, required this.currentPage, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? color ?? AppColors.primaryColor
            : AppColors.hintColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
