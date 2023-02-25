import 'package:flutter/material.dart';

class EnvErrorScreen extends StatelessWidget {
  const EnvErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('There seems to be some issue with the environment setup'),
      ),
    );
  }
}
