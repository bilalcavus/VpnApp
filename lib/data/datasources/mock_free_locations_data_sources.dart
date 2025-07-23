import 'package:vpn_app/data/mock/mock_data.dart';
import 'package:vpn_app/data/models/country_model.dart';

abstract class MockFreeLocationsDataSources  {
  Future<List<CountryModel>> getFreeLocations();
}

class MockFreeLocationsDataSourcesImpl implements MockFreeLocationsDataSources {
  @override
  Future<List<CountryModel>> getFreeLocations() async {
    await Future.delayed(const Duration(seconds: 1));
    return MockData.mockFreeLocations;
  }
}