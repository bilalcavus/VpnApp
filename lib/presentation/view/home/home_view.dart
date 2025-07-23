import 'package:flutter/material.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/theme/custom_theme_color.dart';
import 'package:vpn_app/presentation/view/home/widgets/home_connecting_time_widget.dart';
import 'package:vpn_app/presentation/view/home/widgets/home_connection_section.dart';
import 'package:vpn_app/presentation/view/home/widgets/home_free_locations_widget.dart';
import 'package:vpn_app/presentation/view/home/widgets/home_header_widget.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CountryViewModel _countryViewModel;
  late final ConnectionStatsViewModel _connectionStatsViewModel;
  @override
  void initState() {
    super.initState();
    _countryViewModel = getIt<CountryViewModel>();
    _connectionStatsViewModel = getIt<ConnectionStatsViewModel>();
    _countryViewModel.fetchFreeLocations();
    _countryViewModel.fetchCountries();
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: CustomColorTheme.bottomSheet(context),
    body: SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          SizedBox(height: context.dynamicHeight(0.03)),
          const ConnectingTimeWidget(),
          SizedBox(height: context.dynamicHeight(0.04)),
          const HomeConnectionSection(),
          SizedBox(height: context.dynamicHeight(0.03)),
          FreeLocationWidget(countryViewModel: _countryViewModel, connectionStatsViewModel: _connectionStatsViewModel),
          ],
        ),
      ),
    );
  }
}



