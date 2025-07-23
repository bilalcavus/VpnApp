import 'package:vpn_app/data/mock/mock_data.dart';
import 'package:vpn_app/data/models/country_model.dart';


abstract class MockCountryDataSources {
  Future<List<CountryModel>> getCountries();
}

class MockDataSourcesImpl implements MockCountryDataSources {
  @override
  Future<List<CountryModel>> getCountries() async {
    await Future.delayed(const Duration(seconds: 1));
    return MockData.mockCountries;
  }
  
  
}