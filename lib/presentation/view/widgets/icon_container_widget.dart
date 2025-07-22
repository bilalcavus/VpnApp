
import 'package:flutter/material.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.04),
      width: context.dynamicWidth(0.08),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Icon(icon));
  }
}