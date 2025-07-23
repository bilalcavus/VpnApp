import 'package:get_it/get_it.dart';
import 'package:vpn_app/data/datasources/mock_connection_stats_data_source.dart';
import 'package:vpn_app/data/datasources/mock_country_data_sources.dart';
import 'package:vpn_app/data/datasources/mock_free_locations_data_sources.dart';
import 'package:vpn_app/domain/repositories/connection_stats_repository.dart';
import 'package:vpn_app/domain/repositories/connection_stats_repository_impl.dart';
import 'package:vpn_app/domain/repositories/country_repository.dart';
import 'package:vpn_app/domain/repositories/country_repository_impl.dart';
import 'package:vpn_app/domain/repositories/free_locations_repository.dart';
import 'package:vpn_app/domain/repositories/free_locations_repository_impl.dart';
import 'package:vpn_app/domain/usecases/connection_stats_use_case.dart';
import 'package:vpn_app/domain/usecases/country_use_case.dart';
import 'package:vpn_app/domain/usecases/free_locations_use_case.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {

  // DataSources
  getIt.registerLazySingleton<MockCountryDataSources>(() => MockDataSourcesImpl());
  getIt.registerLazySingleton<MockConnectionStatsDataSource>(() => MockConnectionStatsDataSourceImpl());
  getIt.registerLazySingleton<MockFreeLocationsDataSources>(() => MockFreeLocationsDataSourcesImpl());
  

  // Repositories
  getIt.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ConnectionStatsRepository>(() => ConnectionStatsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<FreeLocationsRepository>(() => FreeLocationsRepositoryImpl(getIt()));


  // UseCases
  getIt.registerLazySingleton<GetCountryUseCase>(() => GetCountryUseCase(getIt()));
  getIt.registerLazySingleton<GetConnectionStatsUseCase>(() => GetConnectionStatsUseCase(getIt()));
  getIt.registerLazySingleton<GetFreeLocationsUseCase>(() => GetFreeLocationsUseCase(getIt()));

  // ViewModels
  getIt.registerLazySingleton(() => CountryViewModel(getIt(), getIt()));
  getIt.registerLazySingleton(() => ConnectionStatsViewModel(getIt()));

}
