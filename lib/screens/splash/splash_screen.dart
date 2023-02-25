import 'package:flutter/material.dart';
import 'package:hire_knock/app_constants/app_images.dart';
import 'package:hire_knock/controllers/splash_controller/splash_controller.dart';
import 'package:hire_knock/widgets/animation/h_animation.dart';
import 'package:hire_knock/widgets/image/h_image.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashController.isApiInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HAnimation(
          animation: HireKnockAnimation.zoomIn,
          child: HText(
            text: 'Hire Knock',
            fontSize: 20,
            isHeader: true,
          ),
        ),
      ),
    );
  }
}
