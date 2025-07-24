import 'package:vpn_app/core/constants/image_paths.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';

class MockData {
  static final mockCountries = [
    const CountryModel(
        name: 'Italy',
        flag: ImagePaths.italy,
        city: 'Rome',
        locationCount: 4,
        strength: 45,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Netherlands',
        flag: ImagePaths.netherlands,
        city: 'Amsterdam',
        locationCount: 4,
        strength: 30,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Germany',
        flag: ImagePaths.germany,
        city: 'Berlin',
        locationCount: 3,
        strength: 50,
        isConnected: false,
      ),
      const CountryModel(
        name: 'France',
        flag: ImagePaths.france,
        city: 'Paris',
        locationCount: 5,
        strength: 35,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Belgium',
        flag: ImagePaths.belgium,
        city: 'Brussels',
        locationCount: 6,
        strength: 42,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Denmark',
        flag: ImagePaths.denmark,
        city: 'Copenhagen',
        locationCount: 3,
        strength: 22,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Spain',
        flag: ImagePaths.spain,
        city: 'Madrid',
        locationCount: 8,
        strength: 48,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Portugal',
        flag: ImagePaths.portugal,
        city: 'Lisbon',
        locationCount: 11,
        strength: 45,
        isConnected: false,
      ),
      const CountryModel(
        name: 'United States',
        flag: ImagePaths.usa,
        city: 'New York',
        locationCount: 9,
        strength: 30,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Turkey',
        flag: ImagePaths.turkey,
        city: 'Istanbul',
        locationCount: 15,
        strength: 80,
        isConnected: false,
      ),
      const CountryModel(
        name: 'United Kingdom',
        flag: ImagePaths.uk,
        city: 'London',
        locationCount: 12,
        strength: 57,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Canada',
        flag: ImagePaths.canada,
        city: 'Ottawa',
        locationCount: 2,
        strength: 15,
        isConnected: false,
      ),
    ];

    static final mockFreeLocations = [
      const CountryModel(
        name: 'Italy',
        flag: ImagePaths.italy,
        city: 'Rome',
        locationCount: 4,
        strength: 45,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Netherlands',
        flag: ImagePaths.netherlands,
        city: 'Amsterdam',
        locationCount: 4,
        strength: 30,
        isConnected: false,
      ),
      const CountryModel(
        name: 'Germany',
        flag: ImagePaths.germany,
        city: 'Berlin',
        locationCount: 3,
        strength: 50,
        isConnected: false,
      ),
      const CountryModel(
        name: 'France',
        flag: ImagePaths.france,
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