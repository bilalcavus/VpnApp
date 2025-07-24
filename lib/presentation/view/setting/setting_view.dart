import 'package:flutter/material.dart';
import 'package:vpn_app/core/constants/text_strings.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';
import 'package:vpn_app/presentation/view/widgets/theme_toggle_button.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThemeToggleButton(),
              SizedBox(height: context.dynamicHeight(0.02)),
              const _AboutApp()
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutApp extends StatelessWidget {
  const _AboutApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.6),
      height: context.dynamicHeight(0.2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(TextStrings.aboutApp, textAlign: TextAlign.center, 
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold
            )),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          const Text(TextStrings.appVersion),
          SizedBox(height: context.dynamicHeight(0.01)),
          const Text(TextStrings.appInfo, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}