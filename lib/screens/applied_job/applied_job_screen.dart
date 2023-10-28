import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class AppliedJobScreen extends StatelessWidget {
  const AppliedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(child: HText(text: 'Applied Job')),
        ],
      ),
    );
  }
}
