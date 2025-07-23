import 'package:vpn_app/core/base/base_use_case.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/connection_stats_repository.dart';

class GetConnectionStatsUseCase extends BaseUseCase<DataState<ConnectionStatsModel>, CountryModel> {
  final ConnectionStatsRepository _connectionStatsRepository;
  
  GetConnectionStatsUseCase(this._connectionStatsRepository);

  @override
  Future<DataState<ConnectionStatsModel>> call([CountryModel? country]) async {
    return await _connectionStatsRepository.getConnectionStats(country!);
  }
}
