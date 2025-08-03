import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/theme/app_style.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';

class MedicineCardWidget extends StatelessWidget {
  final DrugModel medicine;

  const MedicineCardWidget({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorsTheme().cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: ColorsTheme().darkGray.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: ColorsTheme().lightGray.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        title: Text(
          medicine.title ?? 'Unknown',
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.styleBold18sp(context),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Text(
            'Published: ${medicine.publishedDate ?? 'Unknown'}',
            style: AppTextStyles.styleBold14sp(
              context,
            ).copyWith(color: ColorsTheme().grayColor),
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: ColorsTheme().grayColor),
        onTap: () {
          // Navigate to details or handle tap
        },
      ),
    );
  }
}
