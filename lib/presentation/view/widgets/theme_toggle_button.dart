import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/theme/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  ThemeToggleButton({super.key});

  final themeController = getIt<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: themeController,
      builder: (controller) {
        return IconButton(
          icon: Icon(controller.isDarkMode ? Icons.dark_mode : Icons.light_mode),
          onPressed: controller.toggleTheme,
        );
      },
    );
  }
}
