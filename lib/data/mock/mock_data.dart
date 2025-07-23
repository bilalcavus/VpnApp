import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';

class MockData {
  static final mockCountries = [
    const CountryModel(
        name: 'Italy',
        flag: 'assets/flag/italy.png',
        city: 'Rome',
        locationCount: 4,
        strength: 45,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Netherlands',
        flag: 'assets/flag/netherlands.png',
        city: 'Amsterdam',
        locationCount: 4,
        strength: 30,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Germany',
        flag: 'assets/flag/germany.png',
        city: 'Berlin',
        locationCount: 3,
        strength: 50,
        isConnected: false,
      ),
      const CountryModel(
        name: 'France',
        flag: 'assets/flag/france.png',
        city: 'Paris',
        locationCount: 5,
        strength: 35,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Spain',
        flag: 'assets/flag/spain.png',
        city: 'Madrid',
        locationCount: 8,
        strength: 45,
        isConnected: false,
      ),
      const CountryModel(
        name: 'United States',
        flag: 'assets/flag/usa.png',
        city: 'New York',
        locationCount: 9,
        strength: 30,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Turkey',
        flag: 'assets/flag/turkey.png',
        city: 'Istanbul',
        locationCount: 15,
        strength: 80,
        isConnected: false,
      ),
      const CountryModel(
        name: 'United Kingdom',
        flag: 'assets/flag/uk.png',
        city: 'Paris',
        locationCount: 12,
        strength: 57,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Canada',
        flag: 'assets/flag/canada.png',
        city: 'Ottawa',
        locationCount: 2,
        strength: 15,
        isConnected: false,
      ),
    ];

    static final mockFreeLocations = [
      const CountryModel(
        name: 'Italy',
        flag: 'assets/flag/italy.png',
        city: 'Rome',
        locationCount: 4,
        strength: 45,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Netherlands',
        flag: 'assets/flag/netherlands.png',
        city: 'Amsterdam',
        locationCount: 4,
        strength: 30,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Germany',
        flag: 'assets/flag/germany.png',
        city: 'Berlin',
        locationCount: 3,
        strength: 50,
        isConnected: false,
      ),
      const CountryModel(
        name: 'France',
        flag: 'assets/flag/france.png',
        city: 'Paris',
        locationCount: 5,
        strength: 35,
        isConnected: false,
      ),
    ];


    static const mockConnectionStats = ConnectionStatsModel(
      downloadSpeed: 0,
      uploadSpeed: 0,
      connectedTime: Duration.zero,
      connectedCountry: null,
  );
}