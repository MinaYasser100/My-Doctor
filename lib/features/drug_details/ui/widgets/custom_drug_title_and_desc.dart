import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/drug_details/data/model/medicine_details_model/drug_details_model.dart';

class CustomDrugTitleAndDesc extends StatelessWidget {
  const CustomDrugTitleAndDesc({super.key, required this.details});

  final DrugDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsTheme().cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              details.description ?? 'No description available',
              style: TextStyle(fontSize: 14.sp, color: ColorsTheme().grayColor),
            ),
            SizedBox(height: 16.h),
            Text(
              'Published Date',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              details.publishedDate ?? 'Unknown',
              style: TextStyle(fontSize: 14.sp, color: ColorsTheme().grayColor),
            ),
          ],
        ),
      ),
    );
  }
}
