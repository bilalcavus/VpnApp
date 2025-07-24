import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/search/country_search_page.dart';

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
          hintText: TextStrings.searchHint,
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