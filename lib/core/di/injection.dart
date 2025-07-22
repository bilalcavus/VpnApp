import 'package:get_it/get_it.dart';
import 'package:vpn_app/data/datasources/mock_data_sources.dart';
import 'package:vpn_app/domain/repositories/country_repository.dart';
import 'package:vpn_app/domain/repositories/country_repository_impl.dart';
import 'package:vpn_app/domain/usecases/country_use_case.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {

  // DataSources
  getIt.registerLazySingleton<MockDataSources>(() => MockDataSourcesImpl());
  

  // Repositories
  getIt.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(getIt()));


  // UseCases
  getIt.registerLazySingleton<GetCountryUseCase>(() => GetCountryUseCase(getIt()));

  // ViewModels
  getIt.registerLazySingleton(() => CountryViewModel(getIt()));

}
