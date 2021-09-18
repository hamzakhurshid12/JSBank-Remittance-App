import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/balance_card.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_white_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.primaryGradientTop,
        primary: true,
        leading: Container(),
        title: Container(
            width: 150,
            child: Image.asset("assets/images/whitelogo.png"),
          ),
          centerTitle: true
      ),
      body: Container(
        height: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (_, index) => BalanceCard(),
        )
      )
    );
  }
}
