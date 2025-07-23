import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/country_search_page.dart';
import 'package:vpn_app/presentation/view/widgets/icon_container_widget.dart';
import 'package:vpn_app/presentation/viewmodel/country_view_model.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    final countryViewModel = getIt<CountryViewModel>();
    return Container(
      height: context.dynamicHeight(0.25),
      decoration: const BoxDecoration(
        color: Color(0xff1A5CFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dynamicHeight(0.04)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconContainer(icon: HugeIcons.strokeRoundedDashboardSquare01),
                Text('Countries'),
                IconContainer(icon: HugeIcons.strokeRoundedCrown)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.dynamicHeight(0.04), vertical: 0),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(HugeIcons.strokeRoundedSearch01),
                hintText: 'Search for a country or city',
                hintStyle: const TextStyle(
                  color: Color(0xff666666),
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CountrySearchPage()),
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              final countries = countryViewModel.filteredCountries;
              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: Image.asset(country.flag, width: 40),
                    title: Text(country.name),
                    subtitle: Text(country.city ?? ''),
                  );
                },
              );
            }),
          ),
          SizedBox(height: context.dynamicHeight(0.02)),
        ],
      ),
    );
  }
}
