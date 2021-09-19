import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/modules/home/views/home_view.dart';
import 'package:jsbank_remittance/app/modules/transfer/views/transfer_view.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

class TransferSuccessfulView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorHelper.primaryGradientTop,
          primary: true,
          leading: Container(),
          title: SizedBox(
            width: 150,
            child: Image.asset("assets/images/whitelogo.png"),
          ),
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/ic_big_checkmark.png", width: MediaQuery.of(context).size.width * 0.2),
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical:5.0)),
            const Center(
              child: Text("Your money is on its way to your PKR wallet."),
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical:10.0)),
            Container(
              width: MediaQuery.of(context).size.width*0.95,
              height: 55.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: ColorHelper.darkgrey,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(18.0),
                  primary: Colors.white,
                  textStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
                ),
                onPressed: (){
                  Get.to(TransferView());
                },
                child: const Text("Start Another Transaction"),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical:5.0)),
            Container(
              width: MediaQuery.of(context).size.width*0.95,
              height: 55.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: ColorHelper.darkgrey,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(18.0),
                  primary: Colors.white,
                  textStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
                ),
                onPressed: (){
                  Get.to(HomeView());
                },
                child: const Text("Return to Home Screen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
