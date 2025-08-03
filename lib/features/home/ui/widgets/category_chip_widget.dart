import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';

class CategoryChipWidget extends StatelessWidget {
  final String label;
  final String query;

  const CategoryChipWidget({
    super.key,
    required this.label,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: ColorsTheme().primaryLight,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: ColorsTheme().blackColor.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: ColorsTheme().whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
