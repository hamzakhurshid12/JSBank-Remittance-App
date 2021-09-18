import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_button_white.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final void Function() onTap;

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
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onTap: () => Get.back(),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.send,
                    color: ColorHelper.primaryGradientBottom,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Money is on the way to $name, it may take 24 hrs.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                FlatButtonWhite(
                  text: "Make New Payment",
                  width: double.infinity,
                  onPressed: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
