import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameFieldController =
      TextEditingController(text: "John");
  TextEditingController lastNameFieldController =
      TextEditingController(text: "Smith");
  TextEditingController emailFieldController =
      TextEditingController(text: "johnsmith@gmail.com");
  TextEditingController passwordFieldController =
      TextEditingController(text: "");

  RxBool isCharacterLength = false.obs;
  RxBool isUpperLowerCase = false.obs;
  RxBool isSpecialChar = false.obs;
  RxBool isOneNumber = false.obs;
  RxBool isButtonOpen = false.obs;

  // RxBool isAgree = false.obs;

  RxBool isPasswordObscure = true.obs;

  checkPasswordValidate() {
    String pattern = r"(?=.*[a-z])(?=.*[A-Z])\w+";
    RegExp regExp = RegExp(pattern);

    String specialPattern = r'[!@#$%^&*(),.?":{}|<>]';
    RegExp specialPregExp = RegExp(specialPattern);

    String numberPattern = r'[0-9]';
    RegExp numberPregExp = RegExp(numberPattern);

    if (passwordFieldController.text.length > 8) {
      isCharacterLength.value = true;
    } else {
      isCharacterLength.value = false;
    }

    if (regExp.hasMatch(passwordFieldController.text)) {
      isUpperLowerCase.value = true;
    } else {
      isUpperLowerCase.value = false;
    }

    if (specialPregExp.hasMatch(passwordFieldController.text)) {
      isSpecialChar.value = true;
    } else {
      isSpecialChar.value = false;
    }
    if (numberPregExp.hasMatch(passwordFieldController.text)) {
      isOneNumber.value = true;
    } else {
      isOneNumber.value = false;
    }

    if (formKey.currentState!.validate()) {
      isButtonOpen.value = true;
    } else {
      isButtonOpen.value = false;
    }
    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
