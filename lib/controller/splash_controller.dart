// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:scud/view/home.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.off(Home());
    });
  }
}
