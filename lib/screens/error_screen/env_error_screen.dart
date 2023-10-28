import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class EnvErrorScreen extends StatelessWidget {
  const EnvErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('There seems to be some issue with the environment setup'),
      ),
    );
  }
}
