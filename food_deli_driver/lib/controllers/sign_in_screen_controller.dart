import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailFieldController = TextEditingController(text: "abc@gmail.com");
  TextEditingController passwordFieldController = TextEditingController(text: "123456789");

  RxBool isPasswordObscure = true.obs;



  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}