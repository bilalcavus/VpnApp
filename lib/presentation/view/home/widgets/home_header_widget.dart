import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/core/theme/custom_theme_color.dart';
import 'package:vpn_app/presentation/view/home/widgets/home_search_bar.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
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
        ],
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