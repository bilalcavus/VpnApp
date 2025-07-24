
import 'package:flutter/material.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/helper/route_helper.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/presentation/view/search/country_search_page.dart';

class CountryButton extends StatelessWidget {
  final CountryModel country;
  const CountryButton({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.dynamicHeight(0.03)),
      child: GestureDetector(
        onTap: () {
          RouteHelper.push(context, CountrySearchPage());
        },
        child: Container(
          width: context.dynamicWidth(0.7),
          height: context.dynamicHeight(0.07),
          decoration: BoxDecoration(
            color: const Color(0xFF1A5CFF),
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicHeight(0.022),
                ),
              ),
              SizedBox(width: context.dynamicWidth(0.04)),
              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

