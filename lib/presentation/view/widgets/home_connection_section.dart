import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';

class HomeConnectionSection extends StatelessWidget {
  const HomeConnectionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: const FlagIcon(assetPath: 'assets/flag/netherlands.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Netherlands', style: TextStyle(
                      fontSize: context.dynamicHeight(0.02),
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Amsterdam', style: TextStyle(
                      fontSize: context.dynamicHeight(0.015),
                      color: const Color(0xff666666)
                    )),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Stealth'),
                      Text('%14')
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
                value: '527 MB',
                iconColor: Colors.green,
                iconBackgroundColor: Colors.green.withOpacity(0.15),
              ),
              SizedBox(width: context.dynamicWidth(0.025)),
              LoadInfoContainer(
                icon: HugeIcons.strokeRoundedUpload01,
                title: 'Upload:',
                value: '123 MB',
                iconColor: Colors.red,
                iconBackgroundColor: Colors.red.withOpacity(0.15),
              ),
            ],
          )
        ],
      ),
    );
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
