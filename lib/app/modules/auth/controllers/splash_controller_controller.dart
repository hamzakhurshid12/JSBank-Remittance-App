import 'dart:developer';
import 'package:get/get.dart';

class SplashController extends GetxController {

  RxDouble logoDelayValue = 0.0.obs;
  RxDouble buttonPositionValue = 0.0.obs;
  RxDouble buttonOpacityValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void animate() async {
    logoDelayValue.value = 1.0;
    Future.delayed(Duration(seconds: 1), () {
      buttonOpacityValue.value = 1.0;
      buttonPositionValue.value = 30.0;
    });
  }

  @override
  void onReady() {
    super.onReady();
    animate();
    log("read called");
  }

  @override
  void onClose() {}
}
