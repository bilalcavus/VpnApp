import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/datasources/mock_connection_stats_data_source.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/connection_stats_repository_impl.dart';

class TestMockConnectionStatsDataSource implements MockConnectionStatsDataSource {
  Function(CountryModel)? onGetConnectionStats;
  @override
  Future<ConnectionStatsModel> getConnectionStats(CountryModel country) async {
    return await onGetConnectionStats!(country);
  }
}

void main() {
  late ConnectionStatsRepositoryImpl repository;
  late TestMockConnectionStatsDataSource mockDataSource;

  setUp(() {
    mockDataSource = TestMockConnectionStatsDataSource();
    repository = ConnectionStatsRepositoryImpl(mockDataSource);
  });

  const mockCountry = CountryModel(
    name: 'Test',
    flag: '',
    city: 'TestCity',
    locationCount: 1,
    strength: 10,
    isConnected: false,
  );

  const mockStats = ConnectionStatsModel(
    downloadSpeed: 100,
    uploadSpeed: 50,
    connectedTime: Duration(seconds: 0),
    connectedCountry: null,
  );

  test('getConnectionStats success', () async {
    mockDataSource.onGetConnectionStats = (country) async => mockStats;
    final result = await repository.getConnectionStats(mockCountry);
    expect(result, isA<DataSuccess<ConnectionStatsModel>>());
    expect(result.data, mockStats);
  });

  test('getConnectionStats failure', () async {
    mockDataSource.onGetConnectionStats = (country) async => throw FlutterError('error');
    final result = await repository.getConnectionStats(mockCountry);
    expect(result, isA<DataFailed<ConnectionStatsModel>>());
    expect(result.error, isA<FlutterError>());
  });
} 