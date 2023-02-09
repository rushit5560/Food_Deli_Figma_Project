import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPassFieldController = TextEditingController();
  TextEditingController newConfirmPassFieldController = TextEditingController();
  RxBool isNewPassShow = true.obs;
  RxBool isNewConfirmPassShow = true.obs;
  RxBool isButtonOpen = false.obs;


  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}