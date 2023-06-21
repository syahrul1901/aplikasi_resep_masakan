import 'package:aplikasi_resep_masakan/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Resep Masak',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: 'assets/splash.png',
        splashIconSize: 300,
        curve: Curves.easeInBack,
        duration: 2000,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 1500),
        nextScreen: MainWrapper(),
      ),
    );
  }
}
