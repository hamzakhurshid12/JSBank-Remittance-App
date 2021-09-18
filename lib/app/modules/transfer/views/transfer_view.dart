import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
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
          centerTitle: true
      ),
      body: const Center(
        child: Text(
          'TransferView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
