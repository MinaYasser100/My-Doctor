import 'package:go_router/go_router.dart';
import 'package:my_doctor/core/routing/animation_route.dart';
import 'package:my_doctor/core/routing/routes.dart';
import 'package:my_doctor/features/drug_details/data/model/medicine_details_model/drug_details_model.dart';
import 'package:my_doctor/features/drug_details/ui/drug_details_view.dart';
import 'package:my_doctor/features/home/ui/home_view.dart';
import 'package:my_doctor/features/search/ui/search_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => fadeTransitionPage(HomeScreen()),
      ),

      GoRoute(
        path: Routes.homeSearch,
        pageBuilder: (context, state) {
          final query = state.extra as String?;
          if (query == null) throw Exception('Product not found');
          return fadeTransitionPage(SearchView(query: query));
        },
      ),

      GoRoute(
        path: Routes.drugDetails,
        pageBuilder: (context, state) {
          final drugDetailsModel = state.extra as DrugDetailsModel?;
          if (drugDetailsModel == null) throw Exception('Product not found');
          return fadeTransitionPage(DrugDetailsView(details: drugDetailsModel));
        },
      ),
    ],
  );
}

// Future<String> getFirstScreen() async {
//   final isOnboardingSeen = OnboardingHive().isOnboardingSeen();
//   if (!isOnboardingSeen) {
//     return Routes.onboarding;
//   }
//   // Ensure MonitoringSystemHiveService is ready
//   final monitoringService =
//       await GetIt.I.getAsync<MonitoringSystemHiveService>();
//   final farmOwnerStatus = monitoringService.getFarmOwnerStatus();

//   if (farmOwnerStatus == null) {
//     return Routes.userTypeSelectionScreen;
//   } else if (!farmOwnerStatus) {
//     return Routes.layoutScreens;
//   } else if (farmOwnerStatus &&
//       monitoringService.getFarmerSelectedPlants().isEmpty) {
//     return Routes.plantsSelectionScreen;
//   } else {
//     return Routes.layoutScreens;
//   }
// }
