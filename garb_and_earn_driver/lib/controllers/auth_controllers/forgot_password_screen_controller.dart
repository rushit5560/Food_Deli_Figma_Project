import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController phoneNumberFieldController = TextEditingController();

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}