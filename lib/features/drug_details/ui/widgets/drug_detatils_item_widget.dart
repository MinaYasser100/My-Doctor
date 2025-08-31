import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/theme/app_style.dart';
import 'package:my_doctor/core/utils/colors.dart';

class DrugDetailsItemWidget extends StatelessWidget {
  const DrugDetailsItemWidget({
    super.key,
    required this.title,
    required this.textItem,
  });
  final String title;
  final String textItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorsTheme().cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        collapsedBackgroundColor: ColorsTheme().cardColor,
        backgroundColor: ColorsTheme().cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              textItem,
              style: AppTextStyles.styleRegular14sp(
                context,
              ).copyWith(color: ColorsTheme().grayColor),
            ),
          ),
        ],
      ),
    );
  }
}
