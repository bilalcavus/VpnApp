import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/presentation/view/country_search_page.dart';
import 'package:vpn_app/presentation/view/disconnect/widgets/connection_speed_widget.dart';
import 'package:vpn_app/presentation/view/widgets/theme_toggle_button.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class DisconnectingView extends StatefulWidget {
  final ConnectionStatsViewModel connectionStatsViewModel;

  const DisconnectingView({super.key, required this.connectionStatsViewModel});

  @override
  State<DisconnectingView> createState() => _DisconnectingViewState();
}

class _DisconnectingViewState extends State<DisconnectingView> {
  final countryViewModel = getIt<CountryViewModel>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF2F5F9 ),
      appBar: AppBar(
        title:  Text('Disconnect', style: Theme.of(context).textTheme.titleMedium,),
        centerTitle: true,
        // backgroundColor: const Color(0xffF2F5F9),
        actions: [
          ThemeToggleButton()
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final stats = widget.connectionStatsViewModel.connectionStats.value;
          final country = stats.connectedCountry;
          final connected = stats.connectedCountry != null  && country != null && stats.connectedCountry?.name == country.name;
          if (country == null) {
            return  Center(child: ConnectingButton(widget: widget, isConnected: connected),);
          }
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ConnectionSpeedWidget(
                      icon: HugeIcons.strokeRoundedDownload01,
                      color: Colors.blueAccent,
                      label: 'Download',
                      value: stats.downloadSpeed.toDouble(),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey,
                    ),
                    ConnectionSpeedWidget(
                      icon: HugeIcons.strokeRoundedUpload01,
                      color: Colors.amberAccent,
                      label: 'Upload',
                      value: stats.uploadSpeed.toDouble(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.dynamicHeight(0.02)),
              
              ConnectingButton(countryViewModel: countryViewModel, country: country, widget: widget, isConnected: connected),
              SizedBox(height: context.dynamicHeight(0.025)),
              Text(connected ? 'Disconnect' : 'Connect', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: context.dynamicHeight(0.022))),
              SizedBox(height: context.dynamicHeight(0.008)),
              Text(
                _formatDuration(stats.connectedTime),
                style: TextStyle(fontSize: context.dynamicHeight(0.03), letterSpacing: 2),
              ),
              const Spacer(),
              // Country Button
              Padding(
                padding: EdgeInsets.only(bottom: context.dynamicHeight(0.03)),
                child: GestureDetector(
                  onTap: () {
                    RouteHelper.push(context, CountrySearchPage());
                  },
                  child: Container(
                    width: context.dynamicWidth(0.7),
                    height: context.dynamicHeight(0.07),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: context.dynamicHeight(0.045),
                          height: context.dynamicHeight(0.045),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(country.flag),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: context.dynamicWidth(0.04)),
                        Text(
                          country.name,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: context.dynamicHeight(0.022)),
                        ),
                        SizedBox(width: context.dynamicWidth(0.04)),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}

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

