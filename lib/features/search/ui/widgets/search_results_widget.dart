import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/search/manager/cubit/home_search_cubit.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<HomeSearchCubit, HomeSearchState>(
          builder: (context, state) {
            if (state is HomeSearchLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsTheme().accentColor,
                ),
              );
            } else if (state is HomeSearchError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: ColorsTheme().errorColor),
                ),
              );
            } else if (state is HomeSearchLoaded) {
              if (state.results.isEmpty) {
                return Center(
                  child: Text(
                    'No favorites found',
                    style: TextStyle(color: ColorsTheme().grayColor),
                  ),
                );
              } else if (state.query == '') {
                return Center(
                  child: Text(
                    'Search for medicines',
                    style: TextStyle(color: ColorsTheme().grayColor),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.results.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  final medicine = state.results[index];
                  return Card(
                    color: ColorsTheme().cardColor,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.w),
                      title: Text(
                        medicine.title ?? 'Unknown',
                        style: TextStyle(
                          color: ColorsTheme().blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      subtitle: Text(
                        'Published: ${medicine.publishedDate ?? 'Unknown'}',
                        style: TextStyle(
                          color: ColorsTheme().grayColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
