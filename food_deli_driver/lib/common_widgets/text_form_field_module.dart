import 'package:flutter/material.dart';
import 'package:food_deli_driver/utils/styles.dart';

class CommonTextFormFieldModule extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  String hintText;
  bool obscureText;
  final FormFieldValidator? validate;
  Function()? onPressed;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  bool readOnly;
  int? maxLength;


  CommonTextFormFieldModule({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.validate,
    this.onPressed,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validate,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLength: maxLength,
      cursorColor: Colors.grey.shade700,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: InputFieldStyles().inputBorder(),
        focusedBorder: InputFieldStyles().inputBorder(),
        errorBorder: InputFieldStyles().inputBorder(),
        focusedErrorBorder: InputFieldStyles().inputBorder(),
        counterText: '',
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.grey.shade700),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
