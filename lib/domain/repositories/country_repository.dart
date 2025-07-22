import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';

abstract class CountryRepository {
  Future<DataState<List<CountryModel>>> getCountries();
}
