import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/modules/auth/controllers/auth_controller.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_button_white.dart';
import 'package:jsbank_remittance/app/utils/widgets/textFields/white_outline_text_field.dart';
import 'package:jsbank_remittance/app/utils/widgets/dialogs/confirm_email_dialog.dart';

import 'login_view.dart';

class SignupView extends GetView {
  var authorizationController = Get.put(AuthController(), tag: "signUp");
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
              child: buildHeader(screenHeight, screenWidth),
            ),
            Positioned.fill(
              child: Form(key: _formKey, child: buildSignupForm(screenWidth, screenHeight, context)),
            ),
            Positioned.fill(bottom: 30.0, child: buildTermsAndSignupButton(screenWidth, screenHeight, context))
          ],
        ),
      ),
    );
  }

  Column buildTermsAndSignupButton(double screenWidth, double screenHeight, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: buildTermsAndConditionsCheckBox(screenWidth),
        ),
        paddingVerticalMedium(screenHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Obx(() => FlatButtonWhite(
                width: screenWidth * 0.8,
                text: "Sign Up",
                isEnabled: authorizationController.isSignupButtonEnabled.value,
                onPressed: () async {
                  await authorizationController.onClickSignUp();
                  authorizationController.isVerificationEmailSent.value
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmEmailDialog(
                              email: authorizationController.emailController.text,
                              onTap: () {
                                Get.off(() => LoginView());
                              },
                            );
                          }).then((exit) {
                          print("in exit");
                          Get.off(() => LoginView());
                        })
                      : Container();
                },
              ),
          ),
        ),
      ],
    );
  }

  Column buildSignupForm(double screenWidth, double screenHeight, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Sign Up",
            style: TextStyle(color: ColorHelper.whiteColor, fontSize: screenWidth * 0.0420, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
          ),
        ),
        Center(
          child: Text(
            "Let's start with the basics",
            style: TextStyle(color: ColorHelper.whiteColor, fontSize: screenWidth * 0.0327, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: screenHeight * 0.0593)),
        //--------------------------- SIGN UP FORM --------------------------------------------------->
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Row(
            children: [
              WhiteOutlineTextField(
                hintText: "First Name",
                width: screenWidth * 0.8 * 0.49,
                controller: authorizationController.firstNameController,
                focus: () {
                  FocusScope.of(context).requestFocus(authorizationController.lastNameFocus);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.8 * 0.01),
              ),
              WhiteOutlineTextField(
                hintText: "Last Name",
                width: screenWidth * 0.8 * 0.49,
                controller: authorizationController.lastNameController,
                focusNode: authorizationController.lastNameFocus,
                focus: () {
                  FocusScope.of(context).requestFocus(authorizationController.emailFocus);
                },
              ),
            ],
          ),
        ),
        paddingVerticalSmall(screenHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Row(
            children: [
              WhiteOutlineTextField(
                hintText: "CNIC (without dashes)",
                width: screenWidth * 0.8,
                controller: authorizationController.emailController,
                focusNode: authorizationController.emailFocus,
                focus: () {
                  FocusScope.of(context).requestFocus(authorizationController.passwordFocus);
                },
              ),
            ],
          ),
        ),
        paddingVerticalSmall(screenHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Row(
            children: [
              WhiteOutlineTextField(
                hintText: "CNIC issue Date (YYYYMMDD)",
                width: screenWidth * 0.8,
                controller: authorizationController.emailController,
                focusNode: authorizationController.emailFocus,
                focus: () {
                  FocusScope.of(context).requestFocus(authorizationController.passwordFocus);
                },
              ),
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
                  controller: authorizationController.passwordFirstController,
                  focusNode: authorizationController.passwordFocus,
                  focus: () {
                    FocusScope.of(context).requestFocus(authorizationController.passwordAgainFocus);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildHeader(double screenHeight, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: screenHeight * 0.1317)),
        Center(
          child: Image.asset("assets/images/whitelogo.png", width: screenWidth * 0.5),
        ),
        Padding(padding: EdgeInsets.only(top: screenHeight * 0.0886)),
        paddingVerticalMedium(screenHeight),
      ],
    );
  }

  Row buildTermsAndConditionsCheckBox(double screenWidth) {
    return Row(
      children: [
        Obx(
          () => GestureDetector(
            child: Container(
              width: screenWidth * 0.07,
              height: screenWidth * 0.07,
              padding: EdgeInsets.all(6.0),
              decoration: new BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
              child: authorizationController.isTermsAndConditionsChecked.value
                  ? Image.asset("assets/images/ic_checkmark.png", width: 10, height: 10)
                  : null,
            ),
            onTap: () {
              authorizationController.onClickAcceptTermsAndConditions();
            },
          ),
        ),
        paddingHorizontalSmall(),
        RichText(
          text: TextSpan(
              text: "I have read and I agree with the ",
              style: TextStyle(color: ColorHelper.whiteColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
              children: const [
                TextSpan(text: "terms of use", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: " and \n"),
                TextSpan(text: "privacy policy", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "."),
              ]),
        ),
      ],
    );
  }

  Padding paddingHorizontalSmall() => Padding(padding: EdgeInsets.symmetric(horizontal: 2.5));

  Padding paddingVerticalSmall(double screenHeight) => Padding(padding: EdgeInsets.only(top: screenHeight * 0.0095));

  Padding paddingVerticalMedium(double screenHeight) => Padding(padding: EdgeInsets.only(top: screenHeight * 0.01914));
}
