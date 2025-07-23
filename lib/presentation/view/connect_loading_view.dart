import 'package:flutter/material.dart';

class ConnectLoadingView extends StatefulWidget {
  const ConnectLoadingView({super.key});

  @override
  State<ConnectLoadingView> createState() => _ConnectLoadingViewState();
}

class _ConnectLoadingViewState extends State<ConnectLoadingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.power_settings_new,)),
      ),
    );
  }
}