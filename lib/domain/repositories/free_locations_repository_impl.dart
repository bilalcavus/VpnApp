import 'package:flutter/foundation.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/datasources/mock_free_locations_data_sources.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/free_locations_repository.dart';

class FreeLocationsRepositoryImpl implements FreeLocationsRepository {
  final MockFreeLocationsDataSources _mockDataSources;
  const FreeLocationsRepositoryImpl(this._mockDataSources);

  @override
  Future<DataState<List<CountryModel>>> getFreeLocations() async {
    try {
      var result = await _mockDataSources.getFreeLocations();
      return DataSuccess(result);
    } on FlutterError catch (error) {
      return DataFailed(error);
    } catch (e) {
      return DataFailed(FlutterError('An unexpected error occurred: $e'));
    }
  }
}