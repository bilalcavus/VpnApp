import 'package:flutter/widgets.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';

class ConnectionSpeedWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final double value;

  const ConnectionSpeedWidget({super.key, required this.icon, required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: context.dynamicHeight(0.035)),
        SizedBox(height: context.dynamicHeight(0.005)),
        Row(
          children: [
            Text(
            value.toStringAsFixed(2),
            style: TextStyle( fontWeight: FontWeight.bold, fontSize: context.dynamicHeight(0.022)),
          ),
          SizedBox(width: context.dynamicWidth(0.01)),
            Text(
              TextStrings.mb,
            style: TextStyle(fontSize: context.dynamicHeight(0.014)),
            ),
            ],
          ),
        SizedBox(height: context.dynamicHeight(0.003)),
        Text(
          label,
          style: TextStyle(fontSize: context.dynamicHeight(0.014)),
        ),
      ],
    );
  }
} 