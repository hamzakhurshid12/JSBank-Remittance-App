import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
