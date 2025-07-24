import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/datasources/mock_country_data_sources.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/country_repository_impl.dart';

class TestMockCountryDataSources implements MockCountryDataSources {
  Function()? onGetCountries;
  @override
  Future<List<CountryModel>> getCountries() async {
    return await onGetCountries!();
  }
}

void main() {
  late CountryRepositoryImpl repository;
  late TestMockCountryDataSources mockDataSources;

  setUp(() {
    mockDataSources = TestMockCountryDataSources();
    repository = CountryRepositoryImpl(mockDataSources);
  });

  final mockCountries = <CountryModel>[
    const CountryModel(name: 'Test', flag: '', city: 'TestCity', locationCount: 1, strength: 10, isConnected: false),
  ];

  test('getCountries success', () async {
    mockDataSources.onGetCountries = () async => mockCountries;
    final result = await repository.getCountries();
    expect(result, isA<DataSuccess<List<CountryModel>>>());
    expect(result.data, mockCountries);
  });

  test('getCountries failure', () async {
    mockDataSources.onGetCountries = () async => throw FlutterError('error');
    final result = await repository.getCountries();
    expect(result, isA<DataFailed<List<CountryModel>>>());
    expect(result.error, isA<FlutterError>());
  });
} 