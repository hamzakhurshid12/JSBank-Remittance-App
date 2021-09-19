import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController extends GetxController {
  final List<RxBool> isPasswordShownSignUp = [false.obs, false.obs];
  final RxBool isPasswordShownLogin = false.obs;
  final RxBool isTermsAndConditionsChecked = false.obs;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController cnicIssueDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController phoneNumberPinController = TextEditingController();

  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode passwordAgainFocus = FocusNode();
  final FocusNode signInpasswordFocus = FocusNode();
  final isSignupButtonEnabled = false.obs;
  final isSigninButtonEnabled = false.obs;
  final RxBool isVerificationEmailSent = false.obs;

  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController = TextEditingController();


  createUser(String name, String email, String password) async {
  }

  void login(String email, String password) async {

  }

  void showHidePasswordSignUp(fieldId) {
    isPasswordShownSignUp.elementAt(fieldId).value = !isPasswordShownSignUp.elementAt(fieldId).value;
  }

  void showHidePasswordLogin() {
    isPasswordShownLogin.value = !isPasswordShownLogin.value;
  }

  void onClickAcceptTermsAndConditions() {
    isTermsAndConditionsChecked.value = !isTermsAndConditionsChecked.value;
  }

  onClickSignUp() async {
  }

  void onClickSignIn() {
    isSignupButtonEnabled.value = false;
  }

  void signupButtonValidation() {
  }

  void signinButtonValidation() {
    isSigninButtonEnabled.value = signInEmailController.text.isNotEmpty && signInPasswordController.text.isNotEmpty;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signupUser() async {

    var headers = {
      'Authorization': 'Basic TUVpb3JZbm9FODUzc1VVTW1kSmNrQTBubHZ1Y3dyMWo6R1VvRWlHQUFsQ2pnV3JwSw=='
    };
    var request = http.Request('GET', Uri.parse('https://sandbox.jsbl.com/v2/oauth-blb?grant_type=client_credentials'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResp = json.decode(await response.stream.bytesToString()) as Map<String, dynamic>;
      final token = jsonResp["access_token"];
      print(token);
      var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '+token
        };
      var request = http.Request('POST', Uri.parse('https://sandbox.jsbl.com/v2/accountopening-blb'));
      request.body = '''{\r\n"AccountOpeningRequest":{\r\n    "MerchantType" : "0088",\r\n    "TraceNo" : "''' +random(100001,999999).toString()+ '''",\r\n    "CompanyName" : "2Coders",\r\n    "DateTime" : "20210917222100",\r\n    "CNIC" : "''' +cnicController.text +'''",\r\n    "CnicIssuanceDate" : "''' +cnicIssueDateController.text +'''",\r\n    "MobileNo" : "''' +phoneNumberController.text +'''",\r\n    "MobileNetwork" : "MOBILINK",\r\n    "EmailId": "''' +emailController.text +'''"\r\n    }\r\n}''';
      request.headers.addAll(headers);

      http.StreamedResponse response2 = await request.send();
        if (response2.statusCode == 200) {
          final jsonResp2 = json.decode(await response2.stream.bytesToString()) as Map<String, dynamic>;
          Get.snackbar("Response", jsonResp2["AccountOpeningResponse"]["ResponseDetails"][0]);
        }
        else {
          print(response2.reasonPhrase);
        }

      }
      else {
        print(response.reasonPhrase);
      }
  }

  random(min, max){
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  @override
  void onReady() async {
    super.onReady();

    //Signup Screen Listeners
    firstNameController.addListener(signupButtonValidation);
    lastNameController.addListener(signupButtonValidation);
    //Signin Screen Listeners
    signInEmailController.addListener(signinButtonValidation);
    signInPasswordController.addListener(signinButtonValidation);
  }

  @override
  void onClose() async {
  }
}
