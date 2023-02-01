import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController homeAddressFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
}