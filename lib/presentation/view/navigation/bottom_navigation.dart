import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/presentation/view/home_view.dart';
import 'package:vpn_app/presentation/view/widgets/custom_bottom_navigation.dart';
import 'package:vpn_app/presentation/viewmodel/navigation_controller.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final NavigationController navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: navController.currentIndex.value,
          children: const [
            HomeView(),

          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
        ),
      );
    });
  }
}
