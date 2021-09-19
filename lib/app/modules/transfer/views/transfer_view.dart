import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/modules/transfer/views/transfer_successful_view.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_button_white.dart';
import 'package:jsbank_remittance/app/utils/widgets/text/title_text.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  final TransferController _transferController = Get.put(TransferController());

  TransferView({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              children: const [TitleText(text: "Send Money to your PKR Wallet")],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: buildAmountSendRow(context),
            ),
            buildTransactionDetailsCard(context),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: buildAmountReceiveRow(context),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
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
                  if(_transferController.transferMoney()) {
                    Get.to(TransferSuccessfulView());
                  }
                },
                child: const Text("Send Money"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildAmountSendRow(BuildContext context) {
    return Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    controller: _transferController.sendingAmountController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          borderSide: BorderSide(color: ColorHelper.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          borderSide: BorderSide(color: ColorHelper.black)),
                      hintStyle: TextStyle(
                          color: ColorHelper.black,
                          fontFamily: "Roboto",
                          fontSize: 13),
                      labelText: "You send",
                      labelStyle: TextStyle(
                          color: ColorHelper.black,
                          fontFamily: "Roboto",
                          fontSize: 13),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextFormField(
                    onTap: () async {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          print('Select currency: ${currency.name}');
                          _transferController.sendingCurrencyController.text =
                              currency.code;
                          _transferController
                              .updateCurrencyConvertedAmounts();
                        },
                      );
                    },
                    readOnly: true,
                    maxLines: 1,
                    controller: _transferController.sendingCurrencyController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 28, vertical: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        hintStyle: TextStyle(
                            color: ColorHelper.black,
                            fontFamily: "Roboto",
                            fontSize: 11),
                        labelStyle: TextStyle(
                            color: ColorHelper.black,
                            fontFamily: "Roboto",
                            fontSize: 11),
                        )),
              ),
            ],
          );
  }

  Row buildAmountReceiveRow(BuildContext context) {
    return Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                    maxLines: 1,
                    readOnly: true,
                    controller: _transferController.receivingAmountController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          borderSide: BorderSide(color: ColorHelper.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          borderSide: BorderSide(color: ColorHelper.black)),
                      hintStyle: TextStyle(
                          color: ColorHelper.black,
                          fontFamily: "Roboto",
                          fontSize: 13),
                      labelText: "Recepient gets",
                      labelStyle: TextStyle(
                          color: ColorHelper.black,
                          fontFamily: "Roboto",
                          fontSize: 13),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextFormField(
                    readOnly: true,
                    maxLines: 1,
                    controller:
                        _transferController.receivingCurrencyController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                          borderSide: BorderSide(color: ColorHelper.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                          borderSide: BorderSide(color: ColorHelper.black)),
                      hintStyle: TextStyle(
                          color: ColorHelper.black,
                          fontFamily: "Roboto",
                          fontSize: 11),
                      labelStyle: TextStyle(
                          color: ColorHelper.black,
                          fontFamily: "Roboto",
                          fontSize: 11),
                    )),
              ),
            ],
          );
  }

  Card buildTransactionDetailsCard(BuildContext context) {
    return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: ColorHelper.navyBlue2,
          elevation: 10,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.bolt,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Quick\n Transfer',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Colors.white,
                          ),
                          Obx(() => Text(
                                ' ' +
                                    _transferController
                                        .currencyTransferRate.value +
                                    ' Guaranteed transfer rate',
                                style: const TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                          ),
                          Text(
                            ' ' +
                                _transferController
                                    .currencyTransferFee.value +
                                ' ' +
                                _transferController
                                    .sendingCurrencyController.text +
                                ' transfer fee',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.functions,
                            color: Colors.white,
                          ),
                          Text(
                            ' ' +
                                _transferController
                                    .sendingAmountController.text +
                                ' ' +
                                _transferController
                                    .sendingCurrencyController.text +
                                ' converted',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.timelapse,
                            color: Colors.white,
                          ),
                          Text(
                            ' Should take less than a minute',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
