import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/mock/mock_data.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/usecases/connection_stats_use_case.dart';

class ConnectionStatsViewModel extends GetxController {
  var connectionStats = Rx<ConnectionStatsModel>(MockData.mockConnectionStats);
  var selectedCountry = Rxn<CountryModel>();
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var isConnected = false.obs;
  final GetConnectionStatsUseCase _getConnectionStats;

  Timer? _timer;

  ConnectionStatsViewModel(this._getConnectionStats);

  @override
  void onInit() {
    super.onInit();
    fetchConnectionStats();
  }



  Future<void> fetchConnectionStats() async {
  isLoading.value = true;
  errorMessage.value = '';
  try {
    final result = await _getConnectionStats();
    if (result is DataSuccess<ConnectionStatsModel> && result.data != null) {
      connectionStats.value = result.data!;
      errorMessage.value = '';
    } 
    else if (result is DataFailed) {
      errorMessage.value = result.error?.toString() ?? 'Bilinmeyen bir hata oluştu';
    } 
    else {
      errorMessage.value = 'Bilinmeyen bir hata oluştu';
    }
  } catch (e) {
    errorMessage.value = 'Bağlantı istatistikleri alınırken hata oluştu: $e';
  } finally {
    isLoading.value = false;
  }
}

  Future<void> connectToCountry(CountryModel country) async {
    debugPrint('connectToCountry: Connecting to ${country.name}');
    selectedCountry.value = country.copyWith(isConnected: true);
    isConnected.value = true;
    connectionStats.value = connectionStats.value.copyWith(
      connectedCountry: selectedCountry.value,
      connectedTime: Duration.zero,
      downloadSpeed: 0,
      uploadSpeed: 0,
    );
    _timer?.cancel();
    final random = Random();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentDuration = connectionStats.value.connectedTime;
      final newDownload = 500 + random.nextInt(100);
      final newUpload = 40 + random.nextInt(20);
      final newStealth = 0 + random.nextInt(100);
      connectionStats.value = connectionStats.value.copyWith(
        connectedTime: currentDuration + const Duration(seconds: 1),
        downloadSpeed: newDownload,
        uploadSpeed: newUpload,
      );
      selectedCountry.value?.copyWith(strength: newStealth);
    });
  }

  Future<void> disconnected(CountryModel country) async {
    debugPrint('disconnected: Disconnecting');
    _timer?.cancel();
    isConnected.value = false;
    selectedCountry.value = country.copyWith(isConnected: false);
    selectedCountry.value = null;
    connectionStats.value = connectionStats.value.copyWith(
      resetConnectedCountry: true,
      connectedTime: Duration.zero,
      downloadSpeed: 0,
      uploadSpeed: 0,
    );
  }

  @override
void onClose() {
  _timer?.cancel();
  super.onClose();
}
}