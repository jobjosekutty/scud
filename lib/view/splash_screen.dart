import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud/controller/splash_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/scud.png',
        height: 200,
        width: 200,
      )),
    );
  }
}
