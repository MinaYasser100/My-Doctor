import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';

import 'search_bar_widget.dart';
import 'search_results_widget.dart';

class SearchBodyView extends StatelessWidget {
  final String query;

  const SearchBodyView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsTheme().primaryColor, ColorsTheme().backgroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SearchBarWidget(initialQuery: query),
                SizedBox(height: 24.h),
                Text(
                  'Search Results',
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
          SearchResultsWidget(),
        ],
      ),
    );
  }
}
