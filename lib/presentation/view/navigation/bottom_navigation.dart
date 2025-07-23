import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/presentation/view/disconnecting_view.dart';
import 'package:vpn_app/presentation/view/home_view.dart';
import 'package:vpn_app/presentation/view/widgets/custom_bottom_navigation.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/navigation_view_model.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final NavigationViewModel navController = Get.put(NavigationViewModel());
  final connectionStatsViewModel = getIt<ConnectionStatsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: navController.currentIndex.value,
          children:  [
            const HomeView(),
            DisconnectingView(connectionStatsViewModel: connectionStatsViewModel)
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
