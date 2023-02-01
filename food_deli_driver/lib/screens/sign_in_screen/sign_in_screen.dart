import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_deli_driver/common_widgets/button_module.dart';
import 'package:food_deli_driver/common_widgets/common_loader.dart';
import 'package:food_deli_driver/common_widgets/text_form_field_module.dart';
import 'package:food_deli_driver/controllers/sign_in_screen_controller.dart';
import 'package:food_deli_driver/screens/sign_up_screen/sign_up_screen.dart';
import 'package:food_deli_driver/utils/extensions.dart';
import 'package:food_deli_driver/utils/messaging.dart';
import 'package:food_deli_driver/utils/styles.dart';
import 'package:food_deli_driver/utils/validator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  SignInScreenController signInScreenController =
      Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => signInScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : Form(
            key: signInScreenController.formKey,
            child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SignInAppBarModule()
                          .commonSymmetricPadding(horizontal: 10, vertical: 10),
                      Divider(thickness: 1, color: Colors.grey.withOpacity(0.3)),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 6.h),
                              CommonTextFormFieldModule(
                                controller:
                                    signInScreenController.emailFieldController,
                                labelText: AppMessage.emailAddressLabel,
                                hintText: AppMessage.emailAddressHint,
                                keyboardType: TextInputType.emailAddress,
                                validate: (value) =>
                                    FieldValidation().validateEmail(value!),
                              ),
                              SizedBox(height: 6.h),
                              CommonTextFormFieldModule(
                                controller: signInScreenController
                                    .passwordFieldController,
                                labelText: AppMessage.passwordLabel,
                                hintText: AppMessage.passwordHint,
                                obscureText: signInScreenController
                                    .isPasswordObscure.value,
                                validate: (value) =>
                                    FieldValidation().validatePassword(value!),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    signInScreenController
                                            .isPasswordObscure.value =
                                        !signInScreenController
                                            .isPasswordObscure.value;
                                    signInScreenController.loadUI();
                                  },
                                  icon: Icon(
                                    signInScreenController.isPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              RichText(
                                textAlign: TextAlign.left,
                                maxLines: null,
                                text: TextSpan(
                                  text: AppMessage.byLogin,
                                  style: TextStyleConfig.textStyle(
                                    // fontWeight: FontWeight.w600,
                                    textColor: Colors.grey.shade400,
                                    fontSize: 10.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " ${AppMessage.tAndC} ",
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppMessage.and,
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.grey.shade400,
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ${AppMessage.privacyPolicy}",
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Fluttertoast.showToast(msg: "Coming Soon!!");
                                    },
                                    child: Text(
                                      AppMessage.forgotPassword,
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              CommonButtonModule(
                                onTap: () {
                                  if(signInScreenController.formKey.currentState!.validate()){
                                    signInScreenController.emailFieldController.clear();
                                    signInScreenController.passwordFieldController.clear();
                                    Get.to(()=> SignUpScreen());
                                  }
                                },
                                labelText: AppMessage.logIn,
                              ),
                            ],
                          ).commonAllSidePadding(10),
                        ),
                      ),
                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
