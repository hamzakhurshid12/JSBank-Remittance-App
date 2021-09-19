import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsbank_remittance/app/data/Wallets.dart';
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

  var currencyTransferRate = "".obs;
  var currencyTransferFee = "0.0".obs;
  String AllWalletsJsonStr = '{"all_wallets": [{"title": "Local Wallet (PKR)", "amount": 52458.0, "currency": "PKR", "buttonText": ""}, {"title": "HRA Wallet (EUR)", "amount": 252.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 420.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (AOA)", "amount": 0.0, "currency": "AOA", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (ARS)", "amount": 0.0, "currency": "ARS", "buttonText": "Transfer"}, {"title": "HRA Wallet (AMD)", "amount": 0.0, "currency": "AMD", "buttonText": "Transfer"}, {"title": "HRA Wallet (AWG)", "amount": 0.0, "currency": "AWG", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (AZN)", "amount": 0.0, "currency": "AZN", "buttonText": "Transfer"}, {"title": "HRA Wallet (BSD)", "amount": 0.0, "currency": "BSD", "buttonText": "Transfer"}, {"title": "HRA Wallet (BHD)", "amount": 0.0, "currency": "BHD", "buttonText": "Transfer"}, {"title": "HRA Wallet (BDT)", "amount": 0.0, "currency": "BDT", "buttonText": "Transfer"}, {"title": "HRA Wallet (BBD)", "amount": 0.0, "currency": "BBD", "buttonText": "Transfer"}, {"title": "HRA Wallet (BYR)", "amount": 0.0, "currency": "BYR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (BZD)", "amount": 0.0, "currency": "BZD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (BMD)", "amount": 0.0, "currency": "BMD", "buttonText": "Transfer"}, {"title": "HRA Wallet (BTN)", "amount": 0.0, "currency": "BTN", "buttonText": "Transfer"}, {"title": "HRA Wallet (INR)", "amount": 0.0, "currency": "INR", "buttonText": "Transfer"}, {"title": "HRA Wallet (BOB)", "amount": 0.0, "currency": "BOB", "buttonText": "Transfer"}, {"title": "HRA Wallet (BOV)", "amount": 0.0, "currency": "BOV", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (BAM)", "amount": 0.0, "currency": "BAM", "buttonText": "Transfer"}, {"title": "HRA Wallet (BWP)", "amount": 0.0, "currency": "BWP", "buttonText": "Transfer"}, {"title": "HRA Wallet (NOK)", "amount": 0.0, "currency": "NOK", "buttonText": "Transfer"}, {"title": "HRA Wallet (BRL)", "amount": 0.0, "currency": "BRL", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (BND)", "amount": 0.0, "currency": "BND", "buttonText": "Transfer"}, {"title": "HRA Wallet (BGN)", "amount": 0.0, "currency": "BGN", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (BIF)", "amount": 0.0, "currency": "BIF", "buttonText": "Transfer"}, {"title": "HRA Wallet (KHR)", "amount": 0.0, "currency": "KHR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAF)", "amount": 0.0, "currency": "XAF", "buttonText": "Transfer"}, {"title": "HRA Wallet (CAD)", "amount": 0.0, "currency": "CAD", "buttonText": "Transfer"}, {"title": "HRA Wallet (CVE)", "amount": 0.0, "currency": "CVE", "buttonText": "Transfer"}, {"title": "HRA Wallet (KYD)", "amount": 0.0, "currency": "KYD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAF)", "amount": 0.0, "currency": "XAF", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAF)", "amount": 0.0, "currency": "XAF", "buttonText": "Transfer"}, {"title": "HRA Wallet (CLF)", "amount": 0.0, "currency": "CLF", "buttonText": "Transfer"}, {"title": "HRA Wallet (CLP)", "amount": 0.0, "currency": "CLP", "buttonText": "Transfer"}, {"title": "HRA Wallet (CNY)", "amount": 0.0, "currency": "CNY", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (COP)", "amount": 0.0, "currency": "COP", "buttonText": "Transfer"}, {"title": "HRA Wallet (COU)", "amount": 0.0, "currency": "COU", "buttonText": "Transfer"}, {"title": "HRA Wallet (KMF)", "amount": 0.0, "currency": "KMF", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAF)", "amount": 0.0, "currency": "XAF", "buttonText": "Transfer"}, {"title": "HRA Wallet (CDF)", "amount": 0.0, "currency": "CDF", "buttonText": "Transfer"}, {"title": "HRA Wallet (NZD)", "amount": 0.0, "currency": "NZD", "buttonText": "Transfer"}, {"title": "HRA Wallet (CRC)", "amount": 0.0, "currency": "CRC", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (HRK)", "amount": 0.0, "currency": "HRK", "buttonText": "Transfer"}, {"title": "HRA Wallet (CUC)", "amount": 0.0, "currency": "CUC", "buttonText": "Transfer"}, {"title": "HRA Wallet (CUP)", "amount": 0.0, "currency": "CUP", "buttonText": "Transfer"}, {"title": "HRA Wallet (ANG)", "amount": 0.0, "currency": "ANG", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (CZK)", "amount": 0.0, "currency": "CZK", "buttonText": "Transfer"}, {"title": "HRA Wallet (DKK)", "amount": 0.0, "currency": "DKK", "buttonText": "Transfer"}, {"title": "HRA Wallet (DJF)", "amount": 0.0, "currency": "DJF", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (DOP)", "amount": 0.0, "currency": "DOP", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EGP)", "amount": 0.0, "currency": "EGP", "buttonText": "Transfer"}, {"title": "HRA Wallet (SVC)", "amount": 0.0, "currency": "SVC", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAF)", "amount": 0.0, "currency": "XAF", "buttonText": "Transfer"}, {"title": "HRA Wallet (ERN)", "amount": 0.0, "currency": "ERN", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (ETB)", "amount": 0.0, "currency": "ETB", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (FKP)", "amount": 0.0, "currency": "FKP", "buttonText": "Transfer"}, {"title": "HRA Wallet (DKK)", "amount": 0.0, "currency": "DKK", "buttonText": "Transfer"}, {"title": "HRA Wallet (FJD)", "amount": 0.0, "currency": "FJD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XPF)", "amount": 0.0, "currency": "XPF", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAF)", "amount": 0.0, "currency": "XAF", "buttonText": "Transfer"}, {"title": "HRA Wallet (GMD)", "amount": 0.0, "currency": "GMD", "buttonText": "Transfer"}, {"title": "HRA Wallet (GEL)", "amount": 0.0, "currency": "GEL", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (GHS)", "amount": 0.0, "currency": "GHS", "buttonText": "Transfer"}, {"title": "HRA Wallet (GIP)", "amount": 0.0, "currency": "GIP", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (DKK)", "amount": 0.0, "currency": "DKK", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (GTQ)", "amount": 0.0, "currency": "GTQ", "buttonText": "Transfer"}, {"title": "HRA Wallet (GBP)", "amount": 0.0, "currency": "GBP", "buttonText": "Transfer"}, {"title": "HRA Wallet (GNF)", "amount": 0.0, "currency": "GNF", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (GYD)", "amount": 0.0, "currency": "GYD", "buttonText": "Transfer"}, {"title": "HRA Wallet (HTG)", "amount": 0.0, "currency": "HTG", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (HNL)", "amount": 0.0, "currency": "HNL", "buttonText": "Transfer"}, {"title": "HRA Wallet (HKD)", "amount": 0.0, "currency": "HKD", "buttonText": "Transfer"}, {"title": "HRA Wallet (HUF)", "amount": 0.0, "currency": "HUF", "buttonText": "Transfer"}, {"title": "HRA Wallet (ISK)", "amount": 0.0, "currency": "ISK", "buttonText": "Transfer"}, {"title": "HRA Wallet (INR)", "amount": 0.0, "currency": "INR", "buttonText": "Transfer"}, {"title": "HRA Wallet (IDR)", "amount": 0.0, "currency": "IDR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XDR)", "amount": 0.0, "currency": "XDR", "buttonText": "Transfer"}, {"title": "HRA Wallet (IRR)", "amount": 0.0, "currency": "IRR", "buttonText": "Transfer"}, {"title": "HRA Wallet (IQD)", "amount": 0.0, "currency": "IQD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (GBP)", "amount": 0.0, "currency": "GBP", "buttonText": "Transfer"}, {"title": "HRA Wallet (ILS)", "amount": 0.0, "currency": "ILS", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (JMD)", "amount": 0.0, "currency": "JMD", "buttonText": "Transfer"}, {"title": "HRA Wallet (JPY)", "amount": 0.0, "currency": "JPY", "buttonText": "Transfer"}, {"title": "HRA Wallet (GBP)", "amount": 0.0, "currency": "GBP", "buttonText": "Transfer"}, {"title": "HRA Wallet (JOD)", "amount": 0.0, "currency": "JOD", "buttonText": "Transfer"}, {"title": "HRA Wallet (KZT)", "amount": 0.0, "currency": "KZT", "buttonText": "Transfer"}, {"title": "HRA Wallet (KES)", "amount": 0.0, "currency": "KES", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (KPW)", "amount": 0.0, "currency": "KPW", "buttonText": "Transfer"}, {"title": "HRA Wallet (KRW)", "amount": 0.0, "currency": "KRW", "buttonText": "Transfer"}, {"title": "HRA Wallet (KWD)", "amount": 0.0, "currency": "KWD", "buttonText": "Transfer"}, {"title": "HRA Wallet (KGS)", "amount": 0.0, "currency": "KGS", "buttonText": "Transfer"}, {"title": "HRA Wallet (LAK)", "amount": 0.0, "currency": "LAK", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (LBP)", "amount": 0.0, "currency": "LBP", "buttonText": "Transfer"}, {"title": "HRA Wallet (LSL)", "amount": 0.0, "currency": "LSL", "buttonText": "Transfer"}, {"title": "HRA Wallet (ZAR)", "amount": 0.0, "currency": "ZAR", "buttonText": "Transfer"}, {"title": "HRA Wallet (LRD)", "amount": 0.0, "currency": "LRD", "buttonText": "Transfer"}, {"title": "HRA Wallet (LYD)", "amount": 0.0, "currency": "LYD", "buttonText": "Transfer"}, {"title": "HRA Wallet (CHF)", "amount": 0.0, "currency": "CHF", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (MOP)", "amount": 0.0, "currency": "MOP", "buttonText": "Transfer"}, {"title": "HRA Wallet (MKD)", "amount": 0.0, "currency": "MKD", "buttonText": "Transfer"}, {"title": "HRA Wallet (MGA)", "amount": 0.0, "currency": "MGA", "buttonText": "Transfer"}, {"title": "HRA Wallet (MWK)", "amount": 0.0, "currency": "MWK", "buttonText": "Transfer"}, {"title": "HRA Wallet (MYR)", "amount": 0.0, "currency": "MYR", "buttonText": "Transfer"}, {"title": "HRA Wallet (MVR)", "amount": 0.0, "currency": "MVR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (MRO)", "amount": 0.0, "currency": "MRO", "buttonText": "Transfer"}, {"title": "HRA Wallet (MUR)", "amount": 0.0, "currency": "MUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XUA)", "amount": 0.0, "currency": "XUA", "buttonText": "Transfer"}, {"title": "HRA Wallet (MXN)", "amount": 0.0, "currency": "MXN", "buttonText": "Transfer"}, {"title": "HRA Wallet (MXV)", "amount": 0.0, "currency": "MXV", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (MDL)", "amount": 0.0, "currency": "MDL", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (MNT)", "amount": 0.0, "currency": "MNT", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (MAD)", "amount": 0.0, "currency": "MAD", "buttonText": "Transfer"}, {"title": "HRA Wallet (MZN)", "amount": 0.0, "currency": "MZN", "buttonText": "Transfer"}, {"title": "HRA Wallet (MMK)", "amount": 0.0, "currency": "MMK", "buttonText": "Transfer"}, {"title": "HRA Wallet (NAD)", "amount": 0.0, "currency": "NAD", "buttonText": "Transfer"}, {"title": "HRA Wallet (ZAR)", "amount": 0.0, "currency": "ZAR", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (NPR)", "amount": 0.0, "currency": "NPR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XPF)", "amount": 0.0, "currency": "XPF", "buttonText": "Transfer"}, {"title": "HRA Wallet (NZD)", "amount": 0.0, "currency": "NZD", "buttonText": "Transfer"}, {"title": "HRA Wallet (NIO)", "amount": 0.0, "currency": "NIO", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (NGN)", "amount": 0.0, "currency": "NGN", "buttonText": "Transfer"}, {"title": "HRA Wallet (NZD)", "amount": 0.0, "currency": "NZD", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (NOK)", "amount": 0.0, "currency": "NOK", "buttonText": "Transfer"}, {"title": "HRA Wallet (OMR)", "amount": 0.0, "currency": "OMR", "buttonText": "Transfer"}, {"title": "HRA Wallet (AFN)", "amount": 0.0, "currency": "AFN", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (PAB)", "amount": 0.0, "currency": "PAB", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (PGK)", "amount": 0.0, "currency": "PGK", "buttonText": "Transfer"}, {"title": "HRA Wallet (PYG)", "amount": 0.0, "currency": "PYG", "buttonText": "Transfer"}, {"title": "HRA Wallet (PEN)", "amount": 0.0, "currency": "PEN", "buttonText": "Transfer"}, {"title": "HRA Wallet (PHP)", "amount": 0.0, "currency": "PHP", "buttonText": "Transfer"}, {"title": "HRA Wallet (NZD)", "amount": 0.0, "currency": "NZD", "buttonText": "Transfer"}, {"title": "HRA Wallet (PLN)", "amount": 0.0, "currency": "PLN", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (QAR)", "amount": 0.0, "currency": "QAR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (RON)", "amount": 0.0, "currency": "RON", "buttonText": "Transfer"}, {"title": "HRA Wallet (RUB)", "amount": 0.0, "currency": "RUB", "buttonText": "Transfer"}, {"title": "HRA Wallet (RWF)", "amount": 0.0, "currency": "RWF", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (SHP)", "amount": 0.0, "currency": "SHP", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XCD)", "amount": 0.0, "currency": "XCD", "buttonText": "Transfer"}, {"title": "HRA Wallet (WST)", "amount": 0.0, "currency": "WST", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (STD)", "amount": 0.0, "currency": "STD", "buttonText": "Transfer"}, {"title": "HRA Wallet (SAR)", "amount": 0.0, "currency": "SAR", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (RSD)", "amount": 0.0, "currency": "RSD", "buttonText": "Transfer"}, {"title": "HRA Wallet (SCR)", "amount": 0.0, "currency": "SCR", "buttonText": "Transfer"}, {"title": "HRA Wallet (SLL)", "amount": 0.0, "currency": "SLL", "buttonText": "Transfer"}, {"title": "HRA Wallet (SGD)", "amount": 0.0, "currency": "SGD", "buttonText": "Transfer"}, {"title": "HRA Wallet (ANG)", "amount": 0.0, "currency": "ANG", "buttonText": "Transfer"}, {"title": "HRA Wallet (XSU)", "amount": 0.0, "currency": "XSU", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (SBD)", "amount": 0.0, "currency": "SBD", "buttonText": "Transfer"}, {"title": "HRA Wallet (SOS)", "amount": 0.0, "currency": "SOS", "buttonText": "Transfer"}, {"title": "HRA Wallet (ZAR)", "amount": 0.0, "currency": "ZAR", "buttonText": "Transfer"}, {"title": "HRA Wallet (SSP)", "amount": 0.0, "currency": "SSP", "buttonText": "Transfer"}, {"title": "HRA Wallet (EUR)", "amount": 0.0, "currency": "EUR", "buttonText": "Transfer"}, {"title": "HRA Wallet (LKR)", "amount": 0.0, "currency": "LKR", "buttonText": "Transfer"}, {"title": "HRA Wallet (SDG)", "amount": 0.0, "currency": "SDG", "buttonText": "Transfer"}, {"title": "HRA Wallet (SRD)", "amount": 0.0, "currency": "SRD", "buttonText": "Transfer"}, {"title": "HRA Wallet (NOK)", "amount": 0.0, "currency": "NOK", "buttonText": "Transfer"}, {"title": "HRA Wallet (SZL)", "amount": 0.0, "currency": "SZL", "buttonText": "Transfer"}, {"title": "HRA Wallet (SEK)", "amount": 0.0, "currency": "SEK", "buttonText": "Transfer"}, {"title": "HRA Wallet (CHE)", "amount": 0.0, "currency": "CHE", "buttonText": "Transfer"}, {"title": "HRA Wallet (CHF)", "amount": 0.0, "currency": "CHF", "buttonText": "Transfer"}, {"title": "HRA Wallet (CHW)", "amount": 0.0, "currency": "CHW", "buttonText": "Transfer"}, {"title": "HRA Wallet (SYP)", "amount": 0.0, "currency": "SYP", "buttonText": "Transfer"}, {"title": "HRA Wallet (TWD)", "amount": 0.0, "currency": "TWD", "buttonText": "Transfer"}, {"title": "HRA Wallet (TJS)", "amount": 0.0, "currency": "TJS", "buttonText": "Transfer"}, {"title": "HRA Wallet (TZS)", "amount": 0.0, "currency": "TZS", "buttonText": "Transfer"}, {"title": "HRA Wallet (THB)", "amount": 0.0, "currency": "THB", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XOF)", "amount": 0.0, "currency": "XOF", "buttonText": "Transfer"}, {"title": "HRA Wallet (NZD)", "amount": 0.0, "currency": "NZD", "buttonText": "Transfer"}, {"title": "HRA Wallet (TOP)", "amount": 0.0, "currency": "TOP", "buttonText": "Transfer"}, {"title": "HRA Wallet (TTD)", "amount": 0.0, "currency": "TTD", "buttonText": "Transfer"}, {"title": "HRA Wallet (TND)", "amount": 0.0, "currency": "TND", "buttonText": "Transfer"}, {"title": "HRA Wallet (TRY)", "amount": 0.0, "currency": "TRY", "buttonText": "Transfer"}, {"title": "HRA Wallet (TMT)", "amount": 0.0, "currency": "TMT", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (AUD)", "amount": 0.0, "currency": "AUD", "buttonText": "Transfer"}, {"title": "HRA Wallet (UGX)", "amount": 0.0, "currency": "UGX", "buttonText": "Transfer"}, {"title": "HRA Wallet (UAH)", "amount": 0.0, "currency": "UAH", "buttonText": "Transfer"}, {"title": "HRA Wallet (AED)", "amount": 0.0, "currency": "AED", "buttonText": "Transfer"}, {"title": "HRA Wallet (GBP)", "amount": 0.0, "currency": "GBP", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (USN)", "amount": 0.0, "currency": "USN", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (UYI)", "amount": 0.0, "currency": "UYI", "buttonText": "Transfer"}, {"title": "HRA Wallet (UYU)", "amount": 0.0, "currency": "UYU", "buttonText": "Transfer"}, {"title": "HRA Wallet (UZS)", "amount": 0.0, "currency": "UZS", "buttonText": "Transfer"}, {"title": "HRA Wallet (VUV)", "amount": 0.0, "currency": "VUV", "buttonText": "Transfer"}, {"title": "HRA Wallet (VEF)", "amount": 0.0, "currency": "VEF", "buttonText": "Transfer"}, {"title": "HRA Wallet (VND)", "amount": 0.0, "currency": "VND", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (USD)", "amount": 0.0, "currency": "USD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XPF)", "amount": 0.0, "currency": "XPF", "buttonText": "Transfer"}, {"title": "HRA Wallet (MAD)", "amount": 0.0, "currency": "MAD", "buttonText": "Transfer"}, {"title": "HRA Wallet (YER)", "amount": 0.0, "currency": "YER", "buttonText": "Transfer"}, {"title": "HRA Wallet (ZMW)", "amount": 0.0, "currency": "ZMW", "buttonText": "Transfer"}, {"title": "HRA Wallet (ZWL)", "amount": 0.0, "currency": "ZWL", "buttonText": "Transfer"}, {"title": "HRA Wallet (XBA)", "amount": 0.0, "currency": "XBA", "buttonText": "Transfer"}, {"title": "HRA Wallet (XBB)", "amount": 0.0, "currency": "XBB", "buttonText": "Transfer"}, {"title": "HRA Wallet (XBC)", "amount": 0.0, "currency": "XBC", "buttonText": "Transfer"}, {"title": "HRA Wallet (XBD)", "amount": 0.0, "currency": "XBD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XTS)", "amount": 0.0, "currency": "XTS", "buttonText": "Transfer"}, {"title": "HRA Wallet (XXX)", "amount": 0.0, "currency": "XXX", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAU)", "amount": 0.0, "currency": "XAU", "buttonText": "Transfer"}, {"title": "HRA Wallet (XPD)", "amount": 0.0, "currency": "XPD", "buttonText": "Transfer"}, {"title": "HRA Wallet (XPT)", "amount": 0.0, "currency": "XPT", "buttonText": "Transfer"}, {"title": "HRA Wallet (XAG)", "amount": 0.0, "currency": "XAG", "buttonText": "Transfer"}]}';
  late Wallet allWallets;


  @override
  void onInit() {
    super.onInit();
    allWallets = Wallet.fromJson(json.decode(AllWalletsJsonStr) as Map<String, dynamic>);
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

  bool transferMoney(){
    String sendingCurrency = sendingCurrencyController.text.toString();
    String sendingAmount = sendingAmountController.text.toString();
    String receivingAmount = receivingAmountController.text.toString();
    for(var x=0; x<allWallets.allWallets!.length; x++){
      if(allWallets.allWallets![x].currency==sendingCurrency){
        if(allWallets.allWallets![x].amount!>=double.parse(sendingAmount)){
          allWallets.allWallets![x].amount = allWallets.allWallets![x].amount! - double.parse(sendingAmount);
          allWallets.allWallets![0].amount = allWallets.allWallets![0].amount! + double.parse(receivingAmount);
          return true;
        } else {
          print(allWallets.allWallets![x].amount);
          Get.snackbar("Error", "You do not have sufficient balance in your selected wallet.");
          return false;
        }
      }
    }
    return false;
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
    if(sendingAmountController.text.isNotEmpty) {
      double output = getCurrencyConverted(
          sendingCurrencyController.text, receivingCurrencyController.text,
          double.parse(sendingAmountController.text.toString()));
      receivingAmountController.text = output.toStringAsFixed(2);
      currencyTransferRate.value = getCurrencyConverted(
          sendingCurrencyController.text, receivingCurrencyController.text,
          1.0).toStringAsFixed(2);
      currencyTransferRate.refresh();
    } else {
      receivingAmountController.text = "0.00";
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
