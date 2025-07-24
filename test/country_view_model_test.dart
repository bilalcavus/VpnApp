import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/country_repository.dart';
import 'package:vpn_app/domain/repositories/free_locations_repository.dart';
import 'package:vpn_app/domain/usecases/country_use_case.dart';
import 'package:vpn_app/domain/usecases/free_locations_use_case.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class FakeCountryRepository implements CountryRepository {
  @override
  Future<DataState<List<CountryModel>>> getCountries() async => const DataSuccess<List<CountryModel>>([]);
}

class FakeFreeLocationsRepository implements FreeLocationsRepository {
  @override
  Future<DataState<List<CountryModel>>> getFreeLocations() async => const DataSuccess<List<CountryModel>>([]);
}

class MockGetCountryUseCase extends GetCountryUseCase {
  Function()? onCall;

  MockGetCountryUseCase() : super(FakeCountryRepository());
  @override
  Future<DataState<List<CountryModel>>> call([void params]) async {
    assert(onCall != null, 'onCall fonksiyonu testte set edilmemiş!');
    return await onCall!();
  }
}

class MockGetFreeLocationsUseCase extends GetFreeLocationsUseCase {
  Function()? onCall;

  MockGetFreeLocationsUseCase() : super(FakeFreeLocationsRepository());
  @override
  Future<DataState<List<CountryModel>>> call([void params]) async {
    return await onCall!();
  }
}

void main() {
  late CountryViewModel viewModel;
  late MockGetCountryUseCase mockGetCountryUseCase;
  late MockGetFreeLocationsUseCase mockGetFreeLocationsUseCase;

  setUp(() {
    mockGetCountryUseCase = MockGetCountryUseCase();
    mockGetFreeLocationsUseCase = MockGetFreeLocationsUseCase();
    viewModel = CountryViewModel(mockGetCountryUseCase, mockGetFreeLocationsUseCase);
  });

  final mockCountries = <CountryModel>[
    const CountryModel(name: 'Test', flag: '', city: 'TestCity', locationCount: 1, strength: 10, isConnected: false),
    const CountryModel(name: 'Demo', flag: '', city: 'DemoCity', locationCount: 2, strength: 20, isConnected: false),
  ];

  test('fetchCountries success', () async {
    mockGetCountryUseCase.onCall = () async => DataSuccess<List<CountryModel>>(mockCountries);
    await viewModel.fetchCountries();
    expect(viewModel.countries.length, 2);
    expect(viewModel.errorMessage.value, '');
    expect(viewModel.isLoading.value, false);
  });

  test('fetchCountries failure', () async {
    mockGetCountryUseCase.onCall = () async => DataFailed<List<CountryModel>>(FlutterError('error'));
    await viewModel.fetchCountries();
    expect(viewModel.countries.length, 0);
    expect(viewModel.errorMessage.value, contains('error'));
    expect(viewModel.isLoading.value, false);
  });

  test('filterCountries filters by name or city', () async {
    viewModel.countries.value = mockCountries;
    viewModel.filterCountries('Test');
    expect(viewModel.filteredCountries.length, 1);
    viewModel.filterCountries('DemoCity');
    expect(viewModel.filteredCountries.length, 1);
    viewModel.filterCountries('');
    expect(viewModel.filteredCountries.length, 2);
    expect(viewModel.filteredCountries.first.name, 'Test');
  });
} 