import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/presentation/view/connection_loading_view.dart';
import 'package:vpn_app/presentation/view/widgets/flag_icon.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/navigation_view_model.dart';

class CountrySearchPage extends StatelessWidget {
  CountrySearchPage({super.key});

  final CountryViewModel _countryViewModel = getIt<CountryViewModel>();
  final ConnectionStatsViewModel _connectionStatsViewModel = getIt<ConnectionStatsViewModel>();
  final TextEditingController _searchController = TextEditingController();
  final NavigationViewModel navController = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5F9),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search for a country or city',
            border: InputBorder.none,
          ),
          onChanged: _countryViewModel.filterCountries,
        ),
        backgroundColor: const Color(0xffF2F5F9),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Obx(() {
          final countries = _countryViewModel.filteredCountries;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                leading: FlagIcon(assetPath: country.flag),
                title: Text(country.name),
                subtitle: Text(country.city ?? ''),
                trailing: Text('${country.locationCount} Location', style: TextStyle(fontSize: context.dynamicHeight(0.015))),
                onTap: () async {
                  _countryViewModel.setSelectedCountry(country);
                  await _connectionStatsViewModel.connectToCountry(country);
                  RouteHelper.pushAndCloseOther(context, ConnectionLoadingView(country: country));
                },
              );
            },
          );
        }),
      ),
    );
  }
} 