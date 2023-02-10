import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberFieldController =
      TextEditingController(text: "1234567890");

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
