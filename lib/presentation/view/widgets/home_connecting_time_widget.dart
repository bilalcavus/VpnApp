
import 'package:flutter/material.dart';

class ConnectingTimeWidget extends StatelessWidget {
  const ConnectingTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Connecting Time'),
          Text('02:41:52', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          )),
        ],
      ),
    );
  }
}

