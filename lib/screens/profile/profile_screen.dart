import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(child: HText(text: 'Profile')),
        ],
      ),
    );
  }
}
