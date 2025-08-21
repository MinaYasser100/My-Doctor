import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/home/manager/cubit/home_cubit.dart';

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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        bool isSelected =
            state is HomeLoaded && state.selectedCategoryQuery == query;
        return GestureDetector(
          onTap: () {
            if (isSelected) {
              context.read<HomeCubit>().resetFilter();
            } else {
              context.read<HomeCubit>().filterMedicines(query);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorsTheme().whiteColor
                  : ColorsTheme().primaryLight,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? ColorsTheme().primaryColor
                      : ColorsTheme().blackColor.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? ColorsTheme().primaryColor
                    : ColorsTheme().whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
