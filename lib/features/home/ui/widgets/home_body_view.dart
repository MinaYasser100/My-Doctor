import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/core/utils/custom_body_background.dart';

import 'category_chip_widget.dart';
import 'medicines_list_widget.dart';
import 'search_bar_widget.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyBackground(
      child: CustomScrollView(
        slivers: [
          const SearchBarWidget(),
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 24.h),
                Text(
                  'Popular Categories',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme().whiteColor,
                    shadows: [
                      Shadow(
                        color: ColorsTheme().blackColor.withValues(alpha: 0.3),
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 8.h,
                  children: const [
                    CategoryChipWidget(
                      label: 'Pain Relief',
                      query: 'pain relief',
                    ),
                    CategoryChipWidget(
                      label: 'Antibiotics',
                      query: 'antibiotic',
                    ),
                    CategoryChipWidget(label: 'Diabetes', query: 'diabetes'),
                    CategoryChipWidget(
                      label: 'Hypertension',
                      query: 'hypertension',
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Popular Medicines',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme().whiteColor,
                    shadows: [
                      Shadow(
                        color: ColorsTheme().blackColor.withValues(alpha: 0.3),
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
              ]),
            ),
          ),
          const MedicinesListWidget(),
        ],
      ),
    );
  }
}
