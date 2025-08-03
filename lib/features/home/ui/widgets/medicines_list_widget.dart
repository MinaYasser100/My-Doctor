import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/home/manager/cubit/home_cubit.dart';

import 'medicine_card_widget.dart';

class MedicinesListWidget extends StatelessWidget {
  const MedicinesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: RefreshIndicator(
          color: ColorsTheme().accentColor,
          onRefresh: () => context.read<HomeCubit>().fetchPopularMedicines(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorsTheme().accentColor,
                  ),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: ColorsTheme().errorColor),
                  ),
                );
              } else if (state is HomeLoaded) {
                if (state.medicines.isEmpty) {
                  return Center(
                    child: Text(
                      'No medicines found',
                      style: TextStyle(color: ColorsTheme().grayColor),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.medicines.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemBuilder: (context, index) {
                    final medicine = state.medicines[index];
                    return MedicineCardWidget(medicine: medicine);
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
