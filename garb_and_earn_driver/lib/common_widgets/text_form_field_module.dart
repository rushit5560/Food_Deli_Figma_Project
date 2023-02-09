import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/styles.dart';
import 'package:sizer/sizer.dart';


class CommonTextFormFieldModule extends StatelessWidget {
  TextEditingController controller;
  // String labelText;
  final String headerText;
  final String mandatoryText;
  String hintText;
  bool obscureText;
  final FormFieldValidator? validate;
  Function()? onPressed;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  bool readOnly;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;

  CommonTextFormFieldModule({
    Key? key,
    required this.controller,
    required this.headerText,
    required this.mandatoryText,
    // required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.validate,
    this.onPressed,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          maxLines: null,
          text: TextSpan(
              text: headerText,
              style: TextStyleConfig.textStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: ' $mandatoryText',
                  style: TextStyleConfig.textStyle(
                    textColor: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ]),
        ).commonSymmetricPadding(vertical: 4),
        SizedBox(height: 1.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validate,
          keyboardType: keyboardType,
          readOnly: readOnly,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          cursorColor: Colors.grey.shade700,
          obscuringCharacter: "*",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            enabledBorder: InputFieldStyles().inputBorder(),
            focusedBorder: InputFieldStyles().inputBorder(),
            errorBorder: InputFieldStyles().errorBorder(),
            focusedErrorBorder: InputFieldStyles().errorBorder(),
            counterText: '',
            // labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
