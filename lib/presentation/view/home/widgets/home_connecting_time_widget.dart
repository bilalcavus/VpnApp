
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';

class ConnectingTimeWidget extends StatelessWidget {
  const ConnectingTimeWidget({
    super.key,
  });

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final connectionStatsViewModel = getIt<ConnectionStatsViewModel>();
    return Obx(() {
      final duration = connectionStatsViewModel.connectionStats.value.connectedTime;
      final isConnected = connectionStatsViewModel.connectionStats.value.connectedCountry != null;
      return Center(
        child: Column(
          children: [
            const Text(TextStrings.connectingTime),
            Text( isConnected ?
              formatDuration(duration) : TextStrings.nullTime,
              style:  TextStyle(
                fontSize: context.dynamicHeight(0.04),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    });
  }
}

