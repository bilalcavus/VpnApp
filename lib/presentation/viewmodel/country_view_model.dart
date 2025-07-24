import 'package:get/get.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/usecases/country_use_case.dart';
import 'package:vpn_app/domain/usecases/free_locations_use_case.dart';

class CountryViewModel extends GetxController {
  var countries = <CountryModel>[].obs;
  var freeLocations = <CountryModel>[].obs;
  var filteredCountries = <CountryModel>[].obs;
  var selectedCountry = Rxn<CountryModel>();
  var isSearching = false.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  
  final GetCountryUseCase _getCountries;
  final GetFreeLocationsUseCase _getFreeLocations;

  
  CountryViewModel(this._getCountries, this._getFreeLocations);

  
  void setSelectedCountry(CountryModel model) {
    selectedCountry.value = model;
  }
  
  Future<void> fetchCountries() async {
    isLoading.value = true;
    errorMessage.value = '';
    final result = await _getCountries();
    try {
      if (result is DataSuccess<List<CountryModel>>) {
        countries.assignAll(result.data!);
        filteredCountries.assignAll(result.data!);
      } else if (result is DataFailed) {
        errorMessage.value = result.error.toString();
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchFreeLocations() async {
    isLoading.value = true;
    
    errorMessage.value = '';
    final result = await _getFreeLocations();
    try {
      if (result is DataSuccess<List<CountryModel>>) {
        freeLocations.assignAll(result.data!);
      }
      else if(result is DataFailed){
        errorMessage.value = result.error.toString();
      }
    } catch (e) {
      errorMessage.value = 'An error occured: $e';
    }
    finally{
      isLoading.value = false;
    }
  }

  void filterCountries(String searchQuery) {
    if(searchQuery.isEmpty){
      filteredCountries.assignAll(countries);
    } else {
      filteredCountries.assignAll(
        countries.where((country) {
          final countryName = country.name.toLowerCase();
          final cityName = country.city?.toLowerCase() ?? '';
          final input = searchQuery.toLowerCase();
          return countryName.contains(input) || cityName.contains(input);
        }).toList()
      );
    }
  }
}