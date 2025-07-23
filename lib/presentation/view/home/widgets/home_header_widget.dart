import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/theme/custom_theme_color.dart';
import 'package:vpn_app/presentation/view/country_search_page.dart';
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
      decoration: BoxDecoration(
        color: CustomColorTheme.homeHeaderBackground(context),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dynamicHeight(0.04)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IconContainer(icon: HugeIcons.strokeRoundedDashboardSquare01),
                Text('Countries', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white
                )),
                const IconContainer(icon: HugeIcons.strokeRoundedCrown)
              ],
            ),
          ),
          const HomeSearchBar(),
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

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicHeight(0.04), vertical: 0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(HugeIcons.strokeRoundedSearch01),
          hintText: 'Search for a country or city',
          hintStyle: const TextStyle(
            // color: Color(0xff666666),
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
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.05),
      width: context.dynamicWidth(0.11),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Icon(icon, color: Colors.white,));
  }
}