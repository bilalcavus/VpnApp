import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/presentation/view/connection_loading_view.dart';
import 'package:vpn_app/presentation/view/country_info_view.dart';
import 'package:vpn_app/presentation/view/widgets/flag_icon.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class FreeLocationWidget extends StatefulWidget {
  const FreeLocationWidget({
    super.key,
    required CountryViewModel countryViewModel,
    required ConnectionStatsViewModel connectionStatsViewModel,
  }) : _countryViewModel = countryViewModel, _connectionStatsViewModel = connectionStatsViewModel;

  final CountryViewModel _countryViewModel;
  final ConnectionStatsViewModel _connectionStatsViewModel;

  @override
  State<FreeLocationWidget> createState() => _FreeLocationWidgetState();
}

class _FreeLocationWidgetState extends State<FreeLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Free Locations (${widget._countryViewModel.freeLocations.length})'),
              Icon(HugeIcons.strokeRoundedInformationCircle, size: context.dynamicHeight(0.018))
            ],
          ),
          Obx(() {
            if (widget._countryViewModel.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (widget._countryViewModel.errorMessage.isNotEmpty) {
              return Center(
                child: Text(widget._countryViewModel.errorMessage.value),
              );
            } else {
              return ListView.builder(
                itemCount: widget._countryViewModel.freeLocations.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final freeLocation = widget._countryViewModel.freeLocations[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(0.005)),
                    child: Container(
                      height: context.dynamicHeight(0.08),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Obx(() {
                        final isConnected = widget._connectionStatsViewModel
                                .connectionStats.value.connectedCountry?.name ==
                            freeLocation.name;
                        return ListTile(
                          leading: FlagIcon(assetPath: freeLocation.flag),
                          title: Text(freeLocation.name),
                          subtitle: Text('${freeLocation.locationCount} Locations', style: TextStyle(color: Color(0xff666666  )),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FreeLocationsIconButton(
                                icon: Icons.power_settings_new,
                                isConnected: isConnected,
                                onPressed: () { 
                                  if (isConnected) {
                                  widget._connectionStatsViewModel.disconnected(freeLocation);
                                } else {
                                  widget._countryViewModel.setSelectedCountry(freeLocation);
                                    RouteHelper.pushAndCloseOther(
                                      context,
                                      ConnectionLoadingView(country: freeLocation),
                                    );
                                  }
                                },
                              ),
                              SizedBox(width: context.dynamicWidth(.01)),
                              FreeLocationsIconButton(
                                icon: HugeIcons.strokeRoundedArrowRight01,
                                onPressed: () {
                                  widget._countryViewModel.setSelectedCountry(freeLocation);
                                  RouteHelper.push(
                                    context,
                                    CountryInfoView(country: freeLocation),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      }),
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
  final bool? isConnected;
  const FreeLocationsIconButton({
    super.key, required this.icon,
    required this.onPressed, this.isConnected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.1),
      height: context.dynamicHeight(0.06),
      decoration: BoxDecoration(
        color: (isConnected ?? false) ? const Color(0xff1A5CFF) : const Color(0xffF2F5F9),
        shape: BoxShape.circle,
      ),
      child: IconButton(icon: Icon(icon, color: (isConnected ?? false) ? Colors.white : Colors.black),
      padding: EdgeInsets.zero,
      onPressed: onPressed));
  }
}