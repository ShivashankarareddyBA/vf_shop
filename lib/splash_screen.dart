import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vf_shop/constants/image_strings.dart';
import 'package:vf_shop/constants/size.dart';
import 'package:vf_shop/constants/text_strings.dart';
import 'package:vf_shop/splashscreen-logic/splash_screen_logic.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  //so directly  calling to ..
  // ignore: non_constant_identifier_names
  final SplashController = Get.put(SplashScreenController());

  // we no need to replicate  the  instatnce SplashScreenController splashScreenController = SplashScreenController();

// class _SplashScreenState extends State<SplashScreen> {
//its only when statefullWidget

// bool animate = false;

// will use getx package and seperate the logic
// @override
// void initState() {
//   startAnimated(); //created animated function
//   super.initState();
// }

  @override
  Widget build(BuildContext context) {
    // whenever looad  we need to call animation
    SplashController.startAnimation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // obx getx function renedring the UI
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: SplashController.animate.value ? 0 : -30, //animate condition
              left: SplashController.animate.value ? 0 : -30,
              child: const Image(
                image: AssetImage(splashTop),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: SplashController.animate.value ? defaultSize : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: SplashController.animate.value
                    ? 1
                    : 0, //if its animated it will display or 0 means completed hide

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Text(
                      appName,
                      style: TextStyle(fontSize: 30, color: Colors.teal),
                    ),
                    Text(
                      appTagLine,
                      style: TextStyle(fontSize: 20, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: SplashController.animate.value ? 0 : -30,
              right: SplashController.animate.value ? 0 : -30,
              child: const Image(
                image: AssetImage(
                  splashImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  

// will use getx package and seperate the logic
  // Future<void> startAnimated() async {
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   setState(() {
  //     animate = true;
  //   });
  //   await Future.delayed(const Duration(milliseconds: 5000));
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (c) => const TabBarController()));
  // }
//}
