import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {

  final TransferController _transferController = Get.put(TransferController());

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
            padding: EdgeInsets.only(top:20.0),
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
                            BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
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
                            BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
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

          //////////////////////////////Details Card//////////////////////////////////////
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: ColorHelper.navyBlue2,
            elevation: 10,
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.18,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bolt, size: 30, color: Colors.white,),
                        Text('Quick\n Transfer', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          Icon(Icons.attach_money, color: Colors.white,),
                          Text(' 168.1 Guaranteed transfer rate', style: TextStyle(color: Colors.white),),
                        ],),
                        Row(children: [
                          Icon(Icons.remove_circle, color: Colors.white,),
                          Text(' 0.00 CAD transfer fee', style: TextStyle(color: Colors.white),),
                        ],),
                        Row(children: [
                          Icon(Icons.functions, color: Colors.white,),
                          Text(' 125.0 CAD converted', style: TextStyle(color: Colors.white),),
                        ],),
                      ],
                    ),
                  ),
                  /*const ListTile(
                  leading: Icon(Icons.bolt, size: 30),
                  title: Text('Sonu Nigam', style: TextStyle(color: Colors.white),),
                  subtitle: Text('Best of Sonu Nigam Song', style: TextStyle(color: Colors.white)),
                ),*/
                ],
              ),
            ),
          ),

          //////////////////////////////////////////They receive////////////////////////////////////////
          Padding(padding: EdgeInsets.only(top:15.0),),
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
                            BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
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
                            BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: ColorHelper.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
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
