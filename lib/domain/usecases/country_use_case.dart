import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/country_repository.dart';
import 'package:vpn_app/core/base/base_use_case.dart';

class GetCountryUseCase extends BaseUseCase<DataState<List<CountryModel>>> {
  final CountryRepository _countryRepository;

  GetCountryUseCase(this._countryRepository);

  @override
  Future<DataState<List<CountryModel>>> call() async {
    final result = await _countryRepository.getCountries();
    return result;
  }
}