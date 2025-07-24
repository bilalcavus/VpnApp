import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/disconnect/widgets/connecting_button.dart';
import 'package:vpn_app/presentation/view/disconnect/widgets/connection_speed_widget.dart';
import 'package:vpn_app/presentation/view/disconnect/widgets/country_button_widget.dart';
import 'package:vpn_app/presentation/view/widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(title: TextStrings.disconnect),
      body: SafeArea(
        child: _DisconnectingBody(connectionStatsViewModel: widget.connectionStatsViewModel, countryViewModel: countryViewModel, widget: widget, context: context),
      ),
    );
  }
}

class _DisconnectingBody extends StatelessWidget {
  final ConnectionStatsViewModel connectionStatsViewModel;
  final CountryViewModel countryViewModel;
  final DisconnectingView widget;
  final BuildContext context;
  const _DisconnectingBody({required this.connectionStatsViewModel, required this.countryViewModel, required this.widget, required this.context});

  @override
  Widget build(BuildContext _) {
    return Obx(() {
      final stats = connectionStatsViewModel.connectionStats.value;
      final country = stats.connectedCountry;
      final connected = stats.connectedCountry != null && country != null && stats.connectedCountry?.name == country.name;
      if (country == null) {
        return Center(child: ConnectingButton(widget: widget, isConnected: connected));
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
                  label: TextStrings.download,
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
                  label: TextStrings.upload,
                  value: stats.uploadSpeed.toDouble(),
                ),
              ],
            ),
          ),
          SizedBox(height: context.dynamicHeight(0.02)),
          ConnectingButton(countryViewModel: countryViewModel, country: country, widget: widget, isConnected: connected),
          SizedBox(height: context.dynamicHeight(0.025)),
          Text(
            connected ? TextStrings.disconnect : TextStrings.connect,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: context.dynamicHeight(0.022),
            ),
          ),
          SizedBox(height: context.dynamicHeight(0.008)),
          Text(
            _formatDuration(stats.connectedTime),
            style: TextStyle(fontSize: context.dynamicHeight(0.03), letterSpacing: 2),
          ),
          const Spacer(),
          CountryButton(country: country),
        ],
      );
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}



