import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/theme/app_theme.dart';
import 'package:vpn_app/core/theme/theme_controller.dart';
import 'package:vpn_app/presentation/view/navigation/bottom_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          home:  BottomNavigation(),
        ));
  }
}
