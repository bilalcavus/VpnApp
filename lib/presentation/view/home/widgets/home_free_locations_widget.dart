import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/core/theme/custom_theme_color.dart';
import 'package:vpn_app/core/theme/theme_controller.dart';
import 'package:vpn_app/presentation/view/home/widgets/country_info_view.dart';
import 'package:vpn_app/presentation/view/splash/connection_splash_view.dart';
import 'package:vpn_app/presentation/view/widgets/flag_icon.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class FreeLocationWidget extends StatefulWidget {
  const FreeLocationWidget({
    super.key,
    required CountryViewModel countryViewModel,
    required ConnectionStatsViewModel connectionStatsViewModel,
  })  : _countryViewModel = countryViewModel,
        _connectionStatsViewModel = connectionStatsViewModel;

  final CountryViewModel _countryViewModel;
  final ConnectionStatsViewModel _connectionStatsViewModel;

  @override
  State<FreeLocationWidget> createState() => _FreeLocationWidgetState();
}

class _FreeLocationWidgetState extends State<FreeLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (_) {
      final containerColor = Theme.of(context).colorScheme.primaryContainer;
      final textColor = Theme.of(context).colorScheme.onPrimaryContainer;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Free Locations',
                  style: TextStyle(color: textColor),
                ),
                Icon(
                  HugeIcons.strokeRoundedInformationCircle,
                  size: context.dynamicHeight(0.018),
                  color: textColor,
                )
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
                          color: containerColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Obx(() {
                          final isConnected = widget._connectionStatsViewModel
                                  .connectionStats.value.connectedCountry?.name ==
                              freeLocation.name;

                          return ListTile(
                            leading: FlagIcon(assetPath: freeLocation.flag),
                            title: Text(
                              freeLocation.name,
                              style: TextStyle(color: textColor),
                            ),
                            subtitle: Text(
                              '${freeLocation.locationCount} Locations',
                              style: TextStyle(color: textColor.withOpacity(0.6)),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FreeLocationsIconButton(
                                  icon: Icons.power_settings_new,
                                  isConnected: isConnected,
                                  onPressed: () {
                                    if (isConnected) {
                                      widget._connectionStatsViewModel
                                          .disconnected(freeLocation);
                                    } else {
                                      widget._countryViewModel
                                          .setSelectedCountry(freeLocation);
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
            SizedBox(height: context.dynamicHeight(0.01))
          ],
        ),
      );
    });
  }
}

class FreeLocationsIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool? isConnected;

  const FreeLocationsIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = (isConnected ?? false)
        ? const Color(0xff1A5CFF)
        : CustomColorTheme.iconContainerColor(context);

    final iconColor = (isConnected ?? false)
        ? Colors.white
        : theme.colorScheme.onPrimaryContainer;

    return Container(
      width: context.dynamicWidth(0.1),
      height: context.dynamicHeight(0.06),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      ),
    );
  }
}
