import 'package:flutter/material.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';

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
