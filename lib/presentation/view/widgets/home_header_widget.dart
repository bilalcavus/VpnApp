import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/widgets/icon_container_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.25),
      decoration: const BoxDecoration(
        color: Color(0xff1A5CFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child:  Column(
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
            padding: EdgeInsets.symmetric(horizontal: context.dynamicHeight(0.04)),
            child: TextField(
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
                  fontWeight: FontWeight.w300
                )
              ),
            ),
          ),
          SizedBox(height: context.dynamicHeight(0.02)),
        ],
      ),
    );
  }
}
