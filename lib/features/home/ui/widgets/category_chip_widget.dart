import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/home/manager/cubit/home_cubit.dart';

class CategoryChipWidget extends StatefulWidget {
  final String label;
  final String query;

  const CategoryChipWidget({
    super.key,
    required this.label,
    required this.query,
  });

  @override
  State<CategoryChipWidget> createState() => _CategoryChipWidgetState();
}

class _CategoryChipWidgetState extends State<CategoryChipWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isTapped = !isTapped;
        context.read<HomeCubit>().filterMedicines(widget.query);
        if (!isTapped) {
          context.read<HomeCubit>().resetFilter();
        }
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isTapped
              ? ColorsTheme().whiteColor
              : ColorsTheme().primaryLight,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: isTapped
                  ? ColorsTheme().primaryColor
                  : ColorsTheme().whiteColor.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: isTapped
                ? ColorsTheme().primaryColor
                : ColorsTheme().whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
