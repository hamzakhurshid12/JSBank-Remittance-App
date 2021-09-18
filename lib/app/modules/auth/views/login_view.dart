import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/modules/auth/controllers/auth_controller.dart';
import 'package:jsbank_remittance/app/modules/home/views/home_view.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_button_white.dart';
import 'package:jsbank_remittance/app/utils/widgets/dialogs/forgot_password_dialog.dart';
import 'package:jsbank_remittance/app/utils/widgets/dialogs/sms_verification_dialog.dart';
import 'package:jsbank_remittance/app/utils/widgets/textFields/white_outline_text_field.dart';


class LoginView extends GetView {
  var authorizationController = Get.put(AuthController(),tag:"Login");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(gradient: ColorHelper.primaryAppGradient),
        child: Stack(
          children: [
            Positioned.fill(
              top: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: screenHeight * 0.2)),
                  Center(
                    child: Image.asset("assets/images/whitelogo.png", width: screenWidth * 0.5),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: ColorHelper.whiteColor, fontSize: screenWidth * 0.0420, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.0593)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Row(
                        children: [
                          WhiteOutlineTextField(
                            hintText: "CNIC",
                            width: screenWidth * 0.8,
                            controller: authorizationController.signInEmailController,
                            focus: () {
                              FocusScope.of(context).requestFocus(authorizationController.signInpasswordFocus);
                            },
                          )
                        ],
                      ),
                    ),
                    paddingVerticalSmall(screenHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Row(
                        children: [
                          WhiteOutlineTextField(
                              hintText: "Phone Number",
                              width: screenWidth * 0.8,
                              controller: authorizationController.signInPasswordController,
                              focusNode: authorizationController.signInpasswordFocus,
                              focus: () {
                                authorizationController.signInpasswordFocus.unfocus();
                              },
                            ),
                        ],
                      ),
                    ),
                    paddingVerticalMedium(screenHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Obx(() => FlatButtonWhite(
                        width: screenWidth * 0.8,
                        isEnabled: authorizationController.isSigninButtonEnabled.value,
                        text: "Sign In",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SmsVerificationDialog(
                                  codeTextEditingController: authorizationController.phoneNumberPinController,
                                  onTap: () {
                                    print("Pin Code is correct!");
                                    Get.to(HomeView());
                                  },
                                );
                              }
                              );
                        },
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding paddingHorizontalSmall() => Padding(padding: EdgeInsets.symmetric(horizontal: 2.5));

  Padding paddingVerticalSmall(double screenHeight) => Padding(padding: EdgeInsets.only(top: screenHeight * 0.0095));

  Padding paddingVerticalMedium(double screenHeight) => Padding(padding: EdgeInsets.only(top: screenHeight * 0.01914));
}
