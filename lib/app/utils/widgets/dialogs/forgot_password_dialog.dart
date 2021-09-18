import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_button_white.dart';
import 'package:jsbank_remittance/app/utils/widgets/textFields/white_outline_text_field.dart';

class ForgotPasswordDialog extends StatelessWidget {
  ForgotPasswordDialog({
    Key? key,
    required this.onTap,
    required this.emailTextEditingController,
  }) : super(key: key);

  final void Function() onTap;
  late TextEditingController emailTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          gradient: ColorHelper.primaryAppGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        child: Wrap(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 24,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Please provide your email address.\nYou will receive an email with a link to update your password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                WhiteOutlineTextField(
                  hintText: "Email",
                  width: double.infinity,
                  controller: emailTextEditingController,
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: FlatButtonWhite(
                    text: "Reset Password",
                    width: double.infinity,
                    onPressed: onTap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
