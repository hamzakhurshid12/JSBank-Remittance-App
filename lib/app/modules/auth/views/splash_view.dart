import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/modules/auth/controllers/splash_controller_controller.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_white_button.dart';

class SplashView extends GetView {
  final int TRANSITION_DELAY_DURATION = 500;
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ColorHelper.primaryAppGradient),
        child: Stack(
          children: [
            GetX<SplashController>(
              builder: (controller) {
                return Center(
                    child: AnimatedOpacity(
                      opacity: controller.logoDelayValue.value,
                      duration: Duration(milliseconds: TRANSITION_DELAY_DURATION),
                      // The green box must be a child of the AnimatedOpacity widget.
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 58),
                        child: Image.asset(
                          "assets/images/whitelogo.png",
                          height: screenHeight * 0.064,
                          width: screenWidth * 0.6,
                        ),
                      ),
                    ),
                );
              },
            ),
            GetX<SplashController>(
              builder: (controller) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: TRANSITION_DELAY_DURATION),
                  bottom: controller.buttonPositionValue.value,
                  right: 1,
                  left: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: controller.buttonOpacityValue.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                              height: screenHeight * 0.054,
                              width: screenWidth * 0.35,
                              decoration: BoxDecoration(
                                color: ColorHelper.whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: FlatWhiteButton(
                                text: "Sign In",
                                color: ColorHelper.primaryGradientTop,
                                onTap: () {
                                  //Get.to(()=>LoginView());
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(screenWidth * 0.023, 0, 0, 0),
                              height: screenHeight * 0.054,
                              width: screenWidth * 0.35,
                              decoration: BoxDecoration(
                                color: ColorHelper.whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: FlatWhiteButton(
                                text: "Sign Up",
                                color: ColorHelper.primaryGradientBottom,
                                onTap: () {
                                  //Get.to(()=>SignupView());
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

