import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:json_api/client.dart';
import 'package:json_api/routing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TransferController extends GetxController {
  //TODO: Implement TransferController

  late Map<String, dynamic> rates;

  final count = 0.obs;
  TextEditingController sendingCurrencyController = TextEditingController();
  TextEditingController receivingCurrencyController = TextEditingController();
  TextEditingController sendingAmountController = TextEditingController();
  TextEditingController receivingAmountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    updateCurrencyConversion();
  }

  @override
  void onReady() {
    super.onReady();
    sendingCurrencyController.text = "USD";
    receivingCurrencyController.text = "PKR";
    sendingAmountController.text = "0";
    receivingAmountController.text = "0";
  }

  Future<void> updateCurrencyConversion() async {
    Uri baseUri = Uri.parse('http://www.convertmymoney.com/rates.json');
    final response = await http.get(baseUri);
    Map<String, dynamic> jsonResponse = json.decode(response.body) as Map<String, dynamic>;
    rates = jsonResponse.remove("rates") as Map<String, dynamic>;
    sendingAmountController.addListener(updateCurrencyConvertedAmounts);
  }

  double getCurrencyConverted(String sourceCurrency, String destinationCurrency, double sourceAmount){
    final totalDollarsOfSourceCurrency = sourceAmount/rates[sourceCurrency];
    final totalDestinationCurrency = totalDollarsOfSourceCurrency*rates[destinationCurrency];
    return totalDestinationCurrency;
  }

  void updateCurrencyConvertedAmounts(){
    double output = getCurrencyConverted(sendingCurrencyController.text, receivingCurrencyController.text, double.parse(sendingAmountController.text.toString()));
    receivingAmountController.text = output.toStringAsFixed(2);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
