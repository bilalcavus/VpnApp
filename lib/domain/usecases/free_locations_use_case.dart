import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/core/base/base_use_case.dart';
import 'package:vpn_app/domain/repositories/free_locations_repository.dart';

class GetFreeLocationsUseCase extends BaseUseCase<DataState<List<CountryModel>>, void> {
  final FreeLocationsRepository _freeLocationsRepository;

  GetFreeLocationsUseCase(this._freeLocationsRepository);

  @override
  Future<DataState<List<CountryModel>>> call([void params]) async {
    final result = await _freeLocationsRepository.getFreeLocations();
    return result;
  }
}