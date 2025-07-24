import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/presentation/view/navigation/app_navigation.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final CountryViewModel _countryViewModel;
  @override
  void initState() {
    super.initState();
  
    Future.delayed(const Duration(seconds: 4), () {
      RouteHelper.pushAndCloseOther(context, AppNavigation());
      _countryViewModel = getIt<CountryViewModel>();
    _countryViewModel.fetchFreeLocations();
    _countryViewModel.fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/lottie_splash.json'),
          ],
        ),
      ),
    );
  }
}