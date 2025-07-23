import 'package:vpn_app/data/mock/mock_data.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';

abstract class MockConnectionStatsDataSource {
  Future<ConnectionStatsModel> getConnectionStats(CountryModel country);
}

class MockConnectionStatsDataSourceImpl implements MockConnectionStatsDataSource {
  @override
  Future<ConnectionStatsModel> getConnectionStats(CountryModel country) async {
    await Future.delayed(const Duration(seconds: 1));
    return MockData.mockConnectionStats;
  }
}