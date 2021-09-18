import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

class ConfirmEmailDialog extends StatelessWidget {
  ConfirmEmailDialog({
    Key? key,
    required this.onTap,
    required this.email,
  }) : super(key: key);

  final void Function()? onTap;
  final String email;

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
                          "Account verification",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
                    "Please check your email.\nAccount verification link has been sent at $email.\nYou will be able to sign in to your account after verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
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
                      "Continue Sign in",
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
