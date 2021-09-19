import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final List<RxBool> isPasswordShownSignUp = [false.obs, false.obs];
  final RxBool isPasswordShownLogin = false.obs;
  final RxBool isTermsAndConditionsChecked = false.obs;
  final TextEditingController firstNameController = TextEditingController();
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
      'Content-Type': 'application/json',
      'Authorization': 'Bearer opFvkUhxPcDGheGXm9Ja7KYz7MKi'
    };
    var request = http.Request('POST', Uri.parse('https://sandbox.jsbl.com/v2/accountopening-blb'));
    request.body = '''{\r\n"AccountOpeningRequest":{\r\n    "MerchantType" : "0088",\r\n    "TraceNo" : "211212",\r\n    "CompanyName" : "2Coders",\r\n    "DateTime" : "20210917222100",\r\n    "CNIC" : "3310533075974",\r\n    "CnicIssuanceDate" : "20160915",\r\n    "MobileNo" : "03356438145",\r\n    "MobileNetwork" : "UFONE",\r\n    "EmailId": "rnaeem.bese16seecs@seecs.edu.pk"\r\n    }\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
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
