// import 'package:flutter_test/flutter_test.dart';
// import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';
// import 'package:vpn_app/core/resources/data_state.dart';
// import 'package:vpn_app/data/models/country_model.dart';
// import 'package:vpn_app/domain/repositories/country_repository.dart';
// import 'package:vpn_app/domain/repositories/free_locations_repository.dart';
// import 'package:vpn_app/domain/usecases/country_use_case.dart';
// import 'package:vpn_app/domain/usecases/free_locations_use_case.dart';
// import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

// class FakeCountryRepository implements CountryRepository {
//   @override
//   Future<DataState<List<CountryModel>>> getCountries() async => const DataSuccess<List<CountryModel>>([]);
// }

// class FakeFreeLocationsRepository implements FreeLocationsRepository {
//   @override
//   Future<DataState<List<CountryModel>>> getFreeLocations() async => const DataSuccess<List<CountryModel>>([]);
// }

// class FakeCountryUseCase extends GetCountryUseCase {
//   FakeCountryUseCase() : super(FakeCountryRepository());
//   @override
//   Future<DataState<List<CountryModel>>> call([void params]) async => const DataSuccess<List<CountryModel>>([]);
// }

// class FakeFreeLocationsUseCase extends GetFreeLocationsUseCase {
//   FakeFreeLocationsUseCase() : super(FakeFreeLocationsRepository());
//   @override
//   Future<DataState<List<CountryModel>>> call([void params]) async => const DataSuccess<List<CountryModel>>([]);
// }

// void main() {
//   testWidgetsWithLeakTracking('CountryViewModel memory leak test', (tester) async {
//     final viewModel = CountryViewModel(FakeCountryUseCase(), FakeFreeLocationsUseCase());
//     viewModel.setSelectedCountry(
//       const CountryModel(name: 'LeakTest', flag: '', city: '', locationCount: 1, strength: 1, isConnected: false)
//     );
//     // Leak tracker otomatik olarak dispose ve leak kontrolü yapacak
//   });
// } 