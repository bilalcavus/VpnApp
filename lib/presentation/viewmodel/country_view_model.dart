import 'package:get/get.dart';
import 'package:vpn_app/core/resources/data_state.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/usecases/country_use_case.dart';

class CountryViewModel extends GetxController {
  var countries = <CountryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final GetCountryUseCase _getCountries;

  CountryViewModel(this._getCountries);

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }


  Future<void> fetchCountries() async {
    isLoading.value = true;
    errorMessage.value = '';
    final result = await _getCountries();
    try {
      if (result is DataSuccess<List<CountryModel>>) {
      countries.assignAll(result.data!);
    } else if (result is DataFailed) {
      errorMessage.value = result.error.toString();
    }
    } catch (e) {
      errorMessage.value = 'An error occurred while fetching countries: $e';
    } finally {
      isLoading.value = false;
    }
  }
  
}