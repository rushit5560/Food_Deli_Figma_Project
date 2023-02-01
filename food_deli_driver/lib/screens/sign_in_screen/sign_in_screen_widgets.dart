import 'package:flutter/material.dart';
import 'package:food_deli_driver/common_widgets/back_shadow_button_module.dart';
import 'package:food_deli_driver/utils/messaging.dart';
import 'package:sizer/sizer.dart';


class SignInAppBarModule extends StatelessWidget {
  const SignInAppBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /*BackShadowButtonModule(
          onTap: () {},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),*/

        Expanded(
          child: Center(
            child: Text(
              AppMessage.logIn,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),

        /*Padding(
          padding: const EdgeInsets.all(16),
          child: Container(),
        ),*/


      ],
    );
  }
}
