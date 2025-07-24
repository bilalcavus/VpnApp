import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/presentation/view/navigation/app_navigation.dart';
import 'package:vpn_app/presentation/view/widgets/flag_icon.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class ConnectionLoadingView extends StatefulWidget {
  final CountryModel country;
  const ConnectionLoadingView({super.key, required this.country});

  @override
  State<ConnectionLoadingView> createState() => _ConnectionLoadingViewState();
}

class _ConnectionLoadingViewState extends State<ConnectionLoadingView> {
  late final ConnectionStatsViewModel connectionStatsViewModel;
  late final CountryViewModel countryViewModel;
  @override
  void initState() {
    super.initState();
    connectionStatsViewModel = getIt<ConnectionStatsViewModel>();
    countryViewModel = getIt<CountryViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    connectionStatsViewModel.connectToCountry(widget.country);
    _navigateToBack();
  });
  }
  void _navigateToBack() async {
    await Future.delayed(const Duration(seconds: 4));
    final country = countryViewModel.selectedCountry.value;
        final connectedInfo = connectionStatsViewModel.connectionStats.value;
    final connected = connectedInfo.connectedCountry != null &&
                      country != null &&
                      connectedInfo.connectedCountry!.name == country.name;
    connectionStatsViewModel.connectionStats.value.connectedCountry;
    if (connected) {
      RouteHelper.pushAndCloseOther(context, AppNavigation());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/connect_loading.json', height: context.dynamicHeight(0.2)),
              Text(TextStrings.connecting, style: TextStyle(fontSize: context.dynamicHeight(0.03), fontWeight: FontWeight.w400),),
              FlagIcon(assetPath: countryViewModel.selectedCountry.value!.flag)
            ],
          )
        ),
      ),
    );
  }
}