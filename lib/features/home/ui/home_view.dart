import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/home/manager/cubit/home_cubit.dart';
import '../data/repo/home_repo_impl.dart';
import 'widgets/home_body_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(GetIt.instance<HomeRepoImpl>())..fetchPopularMedicines(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsTheme().primaryColor,
          title: Text(
            'Medicine Info',
            style: TextStyle(
              color: ColorsTheme().whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: HomeBodyView(),
      ),
    );
  }
}
