import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class CountryInfoView extends StatefulWidget {
  final CountryModel country;
  const CountryInfoView({super.key, required this.country});

  @override
  State<CountryInfoView> createState() => _CountryInfoViewState();
}

class _CountryInfoViewState extends State<CountryInfoView> {
  late final CountryViewModel countryViewModel;
  late final ConnectionStatsViewModel connectionStatsViewModel;

  @override
  void initState() {
    super.initState();
    countryViewModel = getIt<CountryViewModel>();
    connectionStatsViewModel= getIt<ConnectionStatsViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Country Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _CountryInfoBody(countryViewModel: countryViewModel, connectionStatsViewModel: connectionStatsViewModel, context: context),
    );
  }
}

class _CountryStatsInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  const _CountryStatsInfo({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xff1A5CFF), size: context.dynamicHeight(0.03)),
          SizedBox(height: context.dynamicHeight(0.01)),
          Text(label, style: TextStyle(fontSize: context.dynamicHeight(0.016), color: const Color(0xff666666 ))),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold,
              color: valueColor
            ),
          ),
        ],
      ),
    );
  }
}

class _CountryInfoBody extends StatelessWidget {
  final CountryViewModel countryViewModel;
  final ConnectionStatsViewModel connectionStatsViewModel;
  final BuildContext context;
  const _CountryInfoBody({required this.countryViewModel, required this.connectionStatsViewModel, required this.context});

  @override
  Widget build(BuildContext _) {
    return Obx(() {
      final country = countryViewModel.selectedCountry.value;
      final connectedInfo = connectionStatsViewModel.connectionStats.value;
      final connected = connectedInfo.connectedCountry != null &&
                country != null &&
                connectedInfo.connectedCountry!.name == country.name;

      if (country == null) {
        return const Center(child: Text(TextStrings.noCountrySelected));
      }
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.08)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.dynamicHeight(0.04)),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    country.flag,
                    width: context.dynamicHeight(0.13),
                    height: context.dynamicHeight(0.13),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: context.dynamicHeight(0.02)),
              Text(
                country.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A5CFF),
                ),
              ),
              if (country.city != null && country.city!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    country.city!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              SizedBox(height: context.dynamicHeight(0.03)),
              Container(
                padding: EdgeInsets.all(context.dynamicHeight(0.01)),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CountryStatsInfo(
                      icon: HugeIcons.strokeRoundedLocation05,
                      label: TextStrings.locations,
                      value: country.locationCount.toString(),
                    ),
                    _CountryStatsInfo(
                      icon: HugeIcons.strokeRoundedSignalFull02,
                      label: TextStrings.strength,
                      value: country.strength.toString(),
                    ),
                    _ConnectedStatusInfo(connected: connected),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _ConnectedStatusInfo extends StatelessWidget {
  final bool connected;
  const _ConnectedStatusInfo({required this.connected});

  @override
  Widget build(BuildContext context) {
    return _CountryStatsInfo(
      icon: connected ? HugeIcons.strokeRoundedCheckmarkBadge01 : HugeIcons.strokeRoundedCancelCircle,
      label: TextStrings.connected,
      value: connected ? TextStrings.yes : TextStrings.no,
      valueColor: connected ? Colors.green : Colors.red,
    );
  }
}