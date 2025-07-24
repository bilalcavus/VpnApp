import 'package:flutter/material.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/presentation/view/disconnect/disconnecting_view.dart';
import 'package:vpn_app/presentation/view/search/country_search_page.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class ConnectingButton extends StatelessWidget {
  const ConnectingButton({
    super.key,
    this.countryViewModel,
    this.country,
    required this.widget,
    required this.isConnected
  });

  final CountryViewModel? countryViewModel;
  final CountryModel? country;
  final DisconnectingView widget;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (isConnected) {
          countryViewModel?.setSelectedCountry(country!);
        widget.connectionStatsViewModel.disconnected(country!);
        } else {
            RouteHelper.push(context, CountrySearchPage());
        }
      },
      child: Center(
        child: Container(
          width: context.dynamicWidth(0.38),
          height: context.dynamicWidth(0.38),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [Colors.blue.withOpacity(0.5), Colors.transparent],
              radius: 0.8,
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(context.dynamicWidth(0.04)),
            decoration: const BoxDecoration(
              color: Color(0xff1A5CFF ),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.power_settings_new, color: Colors.white, size: context.dynamicHeight(0.06)),
          ),
        ),
      ),
    );
  }
}