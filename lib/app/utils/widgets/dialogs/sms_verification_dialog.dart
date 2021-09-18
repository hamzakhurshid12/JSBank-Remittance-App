import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

class SmsVerificationDialog extends StatelessWidget {
  SmsVerificationDialog({
    Key? key,
    required this.onTap,
    required this.codeTextEditingController,
  }) : super(key: key);

  final void Function()? onTap;
  late TextEditingController codeTextEditingController;

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
                          "Phone number verification.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
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
                    "Please check your sms .\nYou will receive an sms with an verification code to verify your phone number.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: codeTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter verification code",
                      hintStyle: TextStyle(
                        color: ColorHelper.noFocusTextFieldOutlineDullWhite,
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 20,
                        right: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorHelper.noFocusTextFieldOutlineDullWhite,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorHelper.noFocusTextFieldOutlineDullWhite,
                          width: 2,
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(14),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorHelper.noFocusTextFieldOutlineDullWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Verify",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onTap: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
