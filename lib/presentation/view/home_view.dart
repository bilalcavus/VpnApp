import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/widgets/home_connecting_time_widget.dart';
import 'package:vpn_app/presentation/view/widgets/home_connection_section.dart';
import 'package:vpn_app/presentation/view/widgets/home_header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> freeLocations = [
    'Italy',
    'Germany',
    'France',
    'Spain',
    'Netherlands',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF2F5F9),
      body: Column(
        children: [
          const HomeHeader(),
          SizedBox(height: context.dynamicHeight(0.03)),
          const ConnectingTimeWidget(),
          SizedBox(height: context.dynamicHeight(0.04)),
          const HomeConnectionSection(),
          SizedBox(height: context.dynamicHeight(0.04)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Free Locations'),
                    Icon(HugeIcons.strokeRoundedInformationCircle)
                  ],
                ),
                SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: ListView.builder(
                    itemCount: freeLocations.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(0.01)),
                      child: Container(
                        height: context.dynamicHeight(0.08),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          leading: FlagIcon(assetPath: 'assets/flag/italy.png'),
                          title: Text('Italy',),
                          subtitle: Text('4 Locations'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FreeLocationsIconButton(icon: Icons.power_settings_new,),
                              FreeLocationsIconButton(icon: Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      )
                    );
                  },),
                ),
              ],
            ),
          )
        ],
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
      onPressed: () {
    
      },));
  }
}

