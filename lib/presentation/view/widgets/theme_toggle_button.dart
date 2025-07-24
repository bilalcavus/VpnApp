import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/theme/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  ThemeToggleButton({super.key});

  final themeController = getIt<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: themeController,
      builder: (controller) {
        return Container(
          width: context.dynamicWidth(0.6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(controller.isDarkMode ? 'Dark Theme': 'Light Theme', style: TextStyle(fontSize: context.dynamicHeight(0.018))),
              IconButton(
                icon: Icon(controller.isDarkMode ? Icons.dark_mode : Icons.light_mode, size: context.dynamicHeight(.04),),
                onPressed: controller.toggleTheme,
              ),
            ],
          ),
        );
      },
    );
  }
}
