import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(child: HText(text: 'Hello')),
        ],
      ),
    );
  }
}
