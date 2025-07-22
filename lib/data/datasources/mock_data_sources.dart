import 'package:vpn_app/data/models/country_model.dart';


abstract class MockDataSources {
  Future<List<CountryModel>> getCountries();
}

class MockDataSourcesImpl implements MockDataSources {
  @override
  Future<List<CountryModel>> getCountries() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const CountryModel(
        name: 'Italy',
        flag: 'assets/flag/italy.png',
        city: 'Rome',
        locationCount: 4,
        strength: 5,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Netherlands',
        flag: 'assets/flag/netherlands.png',
        city: 'Amsterdam',
        locationCount: 4,
        strength: 5,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Germany',
        flag: 'assets/flag/germany.png',
        city: 'Berlin',
        locationCount: 3,
        strength: 4,
        isConnected: false,
      ),
      const CountryModel(
        name: 'France',
        flag: 'assets/flag/france.png',
        city: 'Paris',
        locationCount: 5,
        strength: 3,
        isConnected: false,
      ),
    ];
  }
  
}


final mockCountries = [
    const CountryModel(
      name: 'Italy',
      flag: 'assets/flag/italy.png',
      city: 'Rome',
      locationCount: 4,
      strength: 5,
      isConnected: false,
    ),
    const CountryModel(
      name: 'Germany',
      flag: 'assets/flag/germany.png',
      city: 'Berlin',
      locationCount: 3,
      strength: 4,
      isConnected: false,
    ),
    const CountryModel(
      name: 'France',
      flag: 'assets/flag/france.png',
      city: 'Paris',
      locationCount: 5,
      strength: 3,
      isConnected: false,
    ),
  ];