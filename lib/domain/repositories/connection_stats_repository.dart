import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';

abstract class ConnectionStatsRepository {
  Future<DataState<ConnectionStatsModel>> getConnectionStats(CountryModel country);
}