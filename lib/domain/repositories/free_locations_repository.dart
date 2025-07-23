import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';

abstract class FreeLocationsRepository {
  Future<DataState<List<CountryModel>>> getFreeLocations();
}
