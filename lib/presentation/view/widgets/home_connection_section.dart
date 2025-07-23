import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/di/injection.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/viewmodel/connection_stats_view_model.dart';

class HomeConnectionSection extends StatelessWidget {
  const HomeConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionStatsViewModel = getIt<ConnectionStatsViewModel>();
    return Obx(() {
      final stats = connectionStatsViewModel.connectionStats.value;
      final country = stats.connectedCountry;
      return Center(
        child: Column(
          children: [
            Container(
              height: context.dynamicHeight(0.08),
              width: context.dynamicHeight(0.34),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.dynamicHeight(0.015)),
                    child: country != null
                        ? FlagIcon(assetPath: country.flag)
                        : const SizedBox.shrink(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(country?.name ?? 'No Country', 
                      style: TextStyle(
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      ),
                      Text(country?.city ?? '', style: TextStyle(
                        fontSize: context.dynamicHeight(0.015),
                        color: const Color(0xff666666)
                      )),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Stealth'),
                        Text('${country?.strength}%')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadInfoContainer(
                  icon: HugeIcons.strokeRoundedDownload01,
                  title: 'Download:',
                  value: '${stats.downloadSpeed} MB',
                  iconColor: Colors.green,
                  iconBackgroundColor: Colors.green.withOpacity(0.15),
                ),
                SizedBox(width: context.dynamicWidth(0.025)),
                LoadInfoContainer(
                  icon: HugeIcons.strokeRoundedUpload01,
                  title: 'Upload:',
                  value: '${stats.uploadSpeed} MB',
                  iconColor: Colors.red,
                  iconBackgroundColor: Colors.red.withOpacity(0.15),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

class LoadInfoContainer extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  const LoadInfoContainer({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      width: context.dynamicHeight(0.165),
      margin: EdgeInsets.only(top: context.dynamicHeight(0.015)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.dynamicHeight(0.04),
            width: context.dynamicWidth(0.09),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(icon, color: iconColor)),
          SizedBox(width: context.dynamicWidth(0.03)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                fontSize: context.dynamicHeight(0.012),
                fontWeight: FontWeight.w500,
                color: const Color(0xff666666)
              )),
              Text(value, style: TextStyle(
                fontSize: context.dynamicHeight(0.018),
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
          
        ],
      ),
    );
  }
}

class FlagIcon extends StatelessWidget {
  final String assetPath;
  const FlagIcon({
    super.key, required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        assetPath,
        height: context.dynamicHeight(0.04),
    ));
  }
}
