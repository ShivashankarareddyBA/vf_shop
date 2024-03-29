import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vf_shop/constants/colors.dart';
import 'package:vf_shop/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: grey),
      home: SplashScreen(),
    );
  }
}
