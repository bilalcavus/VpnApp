import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/widgets/home_connecting_time_widget.dart';
import 'package:vpn_app/presentation/view/widgets/home_connection_section.dart';
import 'package:vpn_app/presentation/view/widgets/home_header_widget.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CountryViewModel _countryViewModel;
  @override
  void initState() {
    super.initState();
    _countryViewModel = getIt<CountryViewModel>();
    _countryViewModel.fetchCountries();
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffF2F5F9),
    body: SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          SizedBox(height: context.dynamicHeight(0.03)),
          const ConnectingTimeWidget(),
          SizedBox(height: context.dynamicHeight(0.04)),
          const HomeConnectionSection(),
          SizedBox(height: context.dynamicHeight(0.03)),
          Padding(
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
                      itemCount: _countryViewModel.countries.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final country = _countryViewModel.countries[index];
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
                              leading: FlagIcon(assetPath: country.flag),
                              title: Text(country.name),
                              subtitle:
                                  Text('${country.locationCount} Locations'),
                              trailing: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FreeLocationsIconButton(
                                      icon: Icons.power_settings_new),
                                  FreeLocationsIconButton(
                                      icon: Icons.arrow_forward_ios),
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
          ),
        ],
      ),
    ),
  );
}

}

class FreeLocationsIconButton extends StatelessWidget {
  final IconData icon;
  const FreeLocationsIconButton({
    super.key, required this.icon,
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
      onPressed: () {
    
      },));
  }
}

