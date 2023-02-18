import 'package:flutter/material.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class ValidateContainerModule extends StatelessWidget {
  TextEditingController fieldController;
  RxBool isTextValidate;
  ValidateContainerModule({
        Key? key,
        required this.fieldController,
        required this.isTextValidate,
      }) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fieldController.text.isEmpty
              ? Colors.grey
              : isTextValidate.value
              ? Colors.green
              : Colors.red),
      child: Center(
        child: Icon(
          isTextValidate.value
              ? Icons.check
              : Icons.close,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
