import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/routing/app_router.dart';
import 'package:my_doctor/core/utils/theme_data_func.dart';

import 'core/dependency_injection/set_up_dependencies.dart';
import 'features/home/ui/helper/home_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  // Initialize Hive database
  await HomeService.initHomeHiveHelper();
  // Run the MyApp widget
  runApp(const MyApp());
}

/// The root widget of the application
class MyApp extends StatelessWidget {
  /// Creates a new instance of [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Whether to use the minimum text adaptive algorithm
      minTextAdapt: true,
      // Whether to split the screen into multiple parts
      splitScreenMode: true,
      // The builder method of the [ScreenUtilInit] widget
      //
      // This method is called when the [ScreenUtilInit] widget is built.
      //
      // It returns a [MaterialApp] widget that is the root of the application.
      builder: (context, child) {
        return MaterialApp.router(
          // Whether to show the debug banner
          debugShowCheckedModeBanner: false,
          // The theme data of the application
          theme: themeDataFunc(),
          // The router configuration of the application
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
