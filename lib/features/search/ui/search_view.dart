import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/search/data/repo/home_search_repo_impl.dart';
import 'package:my_doctor/features/search/manager/cubit/home_search_cubit.dart';
import 'package:my_doctor/features/search/ui/widgets/search_body_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeSearchCubit(GetIt.instance<HomeSearchRepoImpl>())
            ..searchFavorites(query),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsTheme().primaryColor,
          title: Text(
            'Search Favorites',
            style: TextStyle(
              color: ColorsTheme().whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: SearchBodyView(query: query),
      ),
    );
  }
}
