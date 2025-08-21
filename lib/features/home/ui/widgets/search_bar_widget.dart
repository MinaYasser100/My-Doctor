import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor/core/routing/routes.dart';
import 'package:my_doctor/core/utils/colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 46.h,
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 16.w,
            vertical: 0.h,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: ColorsTheme().darkGray,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: ColorsTheme().blackColor.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search for a medicine...',
                hintStyle: TextStyle(color: ColorsTheme().grayColor),
                prefixIcon: Icon(Icons.search, color: ColorsTheme().whiteColor),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
              style: TextStyle(color: ColorsTheme().whiteColor),
              onSubmitted: (query) {
                context.push(Routes.homeSearch, extra: query);
                controller.clear();
              },
            ),
          ),
        ),
      ),
    );
  }
}
