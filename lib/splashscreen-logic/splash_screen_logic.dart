import 'package:get/get.dart';
import 'package:vf_shop/tabbar_controller.dart';

class SplashScreenController extends GetxController {
  //insteadt of creating instances will write static
  static SplashScreenController get find =>
      Get.find(); // we don't need to call instances
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(const TabBarController());
    //   Navigator.pushReplacement(        context, MaterialPageRoute(builder: (c) => const TabBarController()));
    //
  }
}
