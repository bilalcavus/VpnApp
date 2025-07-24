import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/connection_stats_repository.dart';
import 'package:vpn_app/domain/usecases/connection_stats_use_case.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';

class FakeConnectionStatsRepository implements ConnectionStatsRepository {
  @override
  Future<DataState<ConnectionStatsModel>> getConnectionStats(CountryModel country) async {
    throw UnimplementedError();
  }
}

class MockGetConnectionStatsUseCase extends GetConnectionStatsUseCase {
  Function([CountryModel?])? onCall;
  MockGetConnectionStatsUseCase() : super(FakeConnectionStatsRepository());
  @override
  Future<DataState<ConnectionStatsModel>> call([CountryModel? country]) async {
    return await onCall!(country);
  }
}

void main() {
  late ConnectionStatsViewModel viewModel;
  late MockGetConnectionStatsUseCase mockGetConnectionStatsUseCase;

  setUp(() {
    mockGetConnectionStatsUseCase = MockGetConnectionStatsUseCase();
    viewModel = ConnectionStatsViewModel(mockGetConnectionStatsUseCase);
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

  test('fetchConnectionStats success', () async {
    mockGetConnectionStatsUseCase.onCall = ([country]) async => const DataSuccess<ConnectionStatsModel>(mockStats);
    await viewModel.fetchConnectionStats();
    expect(viewModel.connectionStats.value.downloadSpeed, 100);
    expect(viewModel.errorMessage.value, '');
    expect(viewModel.isLoading.value, false);
  });

  test('fetchConnectionStats failure', () async {
    mockGetConnectionStatsUseCase.onCall = ([country]) async => DataFailed<ConnectionStatsModel>(FlutterError('error'));
    await viewModel.fetchConnectionStats();
    expect(viewModel.errorMessage.value, contains('error'));
    expect(viewModel.isLoading.value, false);
  });

  test('connectToCountry sets selectedCountry and isConnected', () async {
    await viewModel.connectToCountry(mockCountry);
    expect(viewModel.selectedCountry.value?.name, 'Test');
    expect(viewModel.isConnected.value, true);
    expect(viewModel.connectionStats.value.connectedCountry?.name, 'Test');
  });

  test('disconnected resets state', () async {
    await viewModel.connectToCountry(mockCountry);
    await viewModel.disconnected(mockCountry);
    expect(viewModel.isConnected.value, false);
    expect(viewModel.selectedCountry.value, null);
    expect(viewModel.connectionStats.value.connectedCountry, null);
  });
} 