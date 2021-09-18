import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {

  TransferController _transferController = Get.put(TransferController());

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      controller: _transferController.sendingAmountController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
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
                              _transferController.sendingCurrencyController.text = currency.code;
                            },
                          );
                        _transferController.updateCurrencyConvertedAmounts();
                      },
                      readOnly: true,
                      maxLines: 1,
                      controller: _transferController.sendingCurrencyController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
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
            ),
          ),
          //////////////////////////////////////////They recieve////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                      maxLines: 1,
                      readOnly: true,
                      controller: _transferController.receivingAmountController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
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
                      controller: _transferController.receivingCurrencyController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
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
            ),
          ),

        ],
      ),
    );
  }
}
