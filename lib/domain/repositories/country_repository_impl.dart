import 'package:flutter/material.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/datasources/mock_data_sources.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final MockDataSources _mockDataSources;
  CountryRepositoryImpl(this._mockDataSources);

  @override
  Future<DataState<List<CountryModel>>> getCountries() async {
    try {
      var result = await _mockDataSources.getCountries();
      return DataSuccess(result);
    } on FlutterError catch (error) {
      return DataFailed(error);
    } catch (e) {
      return DataFailed(FlutterError('An unexpected error occurred: $e'));
    }
  }
}