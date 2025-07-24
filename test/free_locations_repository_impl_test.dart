import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/datasources/mock_free_locations_data_sources.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/free_locations_repository_impl.dart';

class TestMockFreeLocationsDataSources implements MockFreeLocationsDataSources {
  Function()? onGetFreeLocations;
  @override
  Future<List<CountryModel>> getFreeLocations() async {
    return await onGetFreeLocations!();
  }
}

void main() {
  late FreeLocationsRepositoryImpl repository;
  late TestMockFreeLocationsDataSources mockDataSources;

  setUp(() {
    mockDataSources = TestMockFreeLocationsDataSources();
    repository = FreeLocationsRepositoryImpl(mockDataSources);
  });

  final mockCountries = <CountryModel>[
    const CountryModel(name: 'Test', flag: '', city: 'TestCity', locationCount: 1, strength: 10, isConnected: false),
  ];

  test('getFreeLocations success', () async {
    mockDataSources.onGetFreeLocations = () async => mockCountries;
    final result = await repository.getFreeLocations();
    expect(result, isA<DataSuccess<List<CountryModel>>>());
    expect(result.data, mockCountries);
  });

  test('getFreeLocations failure', () async {
    mockDataSources.onGetFreeLocations = () async => throw FlutterError('error');
    final result = await repository.getFreeLocations();
    expect(result, isA<DataFailed<List<CountryModel>>>());
    expect(result.error, isA<FlutterError>());
  });
} 