import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_notes/Screens/Splash/SplashController.dart';
import 'package:secure_notes/Utils/AppImages.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(AppImages.instance.splashAnim),
      ),
    );
  }
}
