import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstDigitController = TextEditingController();
  TextEditingController secondDigitController = TextEditingController();
  TextEditingController thirdDigitController = TextEditingController();
  TextEditingController fourthDigitController = TextEditingController();

  RxBool isButtonOpen = false.obs;


  Duration duration = const Duration(minutes: 3);

  startTime() {
    timer = Time.peri
  }


  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}