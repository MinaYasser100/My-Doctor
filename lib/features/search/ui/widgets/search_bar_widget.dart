import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/search/manager/cubit/home_search_cubit.dart';

class SearchBarWidget extends StatefulWidget {
  final String initialQuery;

  const SearchBarWidget({super.key, required this.initialQuery});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialQuery;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
          hintText: 'Search favorites...',
          hintStyle: TextStyle(color: ColorsTheme().grayColor),
          prefixIcon: Icon(Icons.search, color: ColorsTheme().whiteColor),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
        style: TextStyle(color: ColorsTheme().whiteColor),
        onChanged: (query) {
          context.read<HomeSearchCubit>().searchFavorites(query);
        },
      ),
    );
  }
}
