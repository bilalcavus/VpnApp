import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/data/models/connection_stats_model.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/presentation/view/home/widgets/country_info_view.dart';
import 'package:vpn_app/presentation/view/widgets/flag_icon.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class HomeConnectionSection extends StatelessWidget {
  const HomeConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionStatsViewModel = getIt<ConnectionStatsViewModel>();
    final countryViewModel = getIt<CountryViewModel>();
    return Center(
      child: Column(
        children: [
          _ReactiveCountryStats(connectionStatsViewModel: connectionStatsViewModel, countryViewModel: countryViewModel),
          _ReactiveLoadSpeedStats(connectionStatsViewModel: connectionStatsViewModel),
        ],
      ),
    );
  }
}

class _ReactiveCountryStats extends StatelessWidget {
  final ConnectionStatsViewModel connectionStatsViewModel;
  final CountryViewModel countryViewModel;
  const _ReactiveCountryStats({required this.connectionStatsViewModel, required this.countryViewModel});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final stats = connectionStatsViewModel.connectionStats.value;
      final country = stats.connectedCountry;
      final isConnected = country != null;
      return _CountryStats(country: country, isConnected: isConnected, countryViewModel: countryViewModel);
    });
  }
}

class _CountryStats extends StatelessWidget {
  const _CountryStats({
    this.country,
    required this.isConnected,
    required this.countryViewModel,
  });

  final CountryModel? country;
  final bool isConnected;
  final CountryViewModel countryViewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        countryViewModel.setSelectedCountry(country!);
        RouteHelper.push(context, CountryInfoView(country: country!));
      },
      child: Container(
        height: context.dynamicHeight(0.08),
        width: context.dynamicHeight(0.34),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(context.dynamicHeight(0.015)),
              child: country != null
                  ? FlagIcon(assetPath: country!.flag)
                  : const SizedBox.shrink(),
            ),
            if (!isConnected)  _notConnectedMessage(context)
            else Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(country?.name ?? '', 
                style: TextStyle(
                  fontSize: context.dynamicHeight(0.02),
                  fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                ),
                Text(country?.city ?? '', style: TextStyle(
                  fontSize: context.dynamicHeight(0.015),
                  color: const Color(0xff666666)
                )),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isConnected ? TextStrings.stealth : ''),
                  Text(isConnected ? '${country?.strength}%' : '', style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _notConnectedMessage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(TextStrings.notConnectStatus,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.dynamicHeight(0.012)))
      ],
    );
  }
}

class _ReactiveLoadSpeedStats extends StatelessWidget {
  final ConnectionStatsViewModel connectionStatsViewModel;
  const _ReactiveLoadSpeedStats({required this.connectionStatsViewModel});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final stats = connectionStatsViewModel.connectionStats.value;
      return _LoadSpeedStats(stats: stats);
    });
  }
}

class _LoadSpeedStats extends StatelessWidget {
  const _LoadSpeedStats({
    required this.stats,
  });

  final ConnectionStatsModel stats;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LoadSpeedContainer(
          icon: HugeIcons.strokeRoundedDownload01,
          title: TextStrings.download,
          value: '${stats.downloadSpeed} MB',
          iconColor: Colors.green,
          iconBackgroundColor: Colors.green.withOpacity(0.15),
        ),
        SizedBox(width: context.dynamicWidth(0.025)),
        _LoadSpeedContainer(
          icon: HugeIcons.strokeRoundedUpload01,
          title: TextStrings.upload,
          value: '${stats.uploadSpeed} MB',
          iconColor: Colors.red,
          iconBackgroundColor: Colors.red.withOpacity(0.15),
        ),
      ],
    );
  }
}

class _LoadSpeedContainer extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  const _LoadSpeedContainer({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      width: context.dynamicHeight(0.165),
      margin: EdgeInsets.only(top: context.dynamicHeight(0.015)),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.dynamicHeight(0.04),
            width: context.dynamicWidth(0.09),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(icon, color: iconColor)),
          SizedBox(width: context.dynamicWidth(0.03)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                fontSize: context.dynamicHeight(0.012),
                fontWeight: FontWeight.w500,
                color: const Color(0xff666666)
              )),
              Text(value, style: TextStyle(
                fontSize: context.dynamicHeight(0.018),
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
          
        ],
      ),
    );
  }
}