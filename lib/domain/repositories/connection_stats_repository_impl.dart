import 'package:flutter/material.dart';
import 'package:vpn_app/data/datasources/mock_connection_stats_data_source.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/connection_stats_repository.dart';

import '../../core/resources/data_state.dart';

class ConnectionStatsRepositoryImpl implements ConnectionStatsRepository {
  final MockConnectionStatsDataSource _mockDataSource;
  ConnectionStatsRepositoryImpl(this._mockDataSource);
  @override
  Future<DataState<ConnectionStatsModel>> getConnectionStats(CountryModel country) async {
     try {
      var result = await _mockDataSource.getConnectionStats(country);
      return DataSuccess(result);
    } on FlutterError catch (error) {
      return DataFailed(error);
    } catch (e) {
      return DataFailed(FlutterError('An unexpected error occurred: $e'));
    }
  }
}