import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/presentation/view/connect_loading_view.dart';
import 'package:vpn_app/presentation/view/widgets/home_connection_section.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class FreeLocationWidget extends StatelessWidget {
  const FreeLocationWidget({
    super.key,
    required CountryViewModel countryViewModel,
    required ConnectionStatsViewModel connectionStatsViewModel,
  }) : _countryViewModel = countryViewModel, _connectionStatsViewModel = connectionStatsViewModel;

  final CountryViewModel _countryViewModel;
  final ConnectionStatsViewModel _connectionStatsViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Free Locations'),
              Icon(HugeIcons.strokeRoundedInformationCircle, size: 16)
            ],
          ),
          Obx(() {
            if (_countryViewModel.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (_countryViewModel.errorMessage.isNotEmpty) {
              return Center(
                child: Text(_countryViewModel.errorMessage.value),
              );
            } else {
              return ListView.builder(
                itemCount: _countryViewModel.freeLocations.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final freeLocation = _countryViewModel.freeLocations[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.dynamicHeight(0.005)),
                    child: Container(
                      height: context.dynamicHeight(0.08),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: FlagIcon(assetPath: freeLocation.flag),
                        title: Text(freeLocation.name),
                        subtitle:
                            Text('${freeLocation.locationCount} Locations'),
                        trailing:  Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            FreeLocationsIconButton(
                              icon: Icons.power_settings_new,
                              onPressed: () {
                                _connectionStatsViewModel.connectToCountry(freeLocation);
                              },
                            ),
                            SizedBox(width: context.dynamicWidth(.01)),
                            FreeLocationsIconButton(icon: HugeIcons.strokeRoundedArrowRight01, onPressed: (){
                              RouteHelper.push(context, const ConnectLoadingView());
                            })
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ],
      ),
    );
  }
}

class FreeLocationsIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const FreeLocationsIconButton({
    super.key, required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.08),
      height: context.dynamicHeight(0.06),
      decoration: const BoxDecoration(
        color: Color(0xffF2F5F9),
        shape: BoxShape.circle,
      ),
      child: IconButton(icon: Icon(icon),
      padding: EdgeInsets.zero,
      onPressed: onPressed));
  }
}