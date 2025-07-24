import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/presentation/view/splash/connection_splash_view.dart';
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: TextStrings.searchHint,
            border: InputBorder.none,
          ),
          onChanged: _countryViewModel.filterCountries,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final countries = _countryViewModel.filteredCountries;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return _CountryListTile(
                country: country,
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

class _CountryListTile extends StatelessWidget {
  final dynamic country;
  final VoidCallback onTap;
  const _CountryListTile({required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlagIcon(assetPath: country.flag),
      title: Text(country.name),
      subtitle: country.city != null && country.city.isNotEmpty
          ? Text(country.city)
          : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${country.locationCount} Location',
            style: TextStyle(fontSize: context.dynamicHeight(0.015)),
          ),
          const Text(TextStrings.tapToConnect, style: TextStyle(color: Color(0xff666666 )),)
        ],
      ),
      onTap: onTap,
    );
  }
} 