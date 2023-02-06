import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../back_shadow_button_module.dart';


class AppBarWithBackButtonModule extends StatelessWidget {
  final String headerText;
  final Function()? backButtonOnTap;
  const AppBarWithBackButtonModule({Key? key, required this.headerText, this.backButtonOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackShadowButtonModule(
          onTap: backButtonOnTap,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),

        Expanded(
          child: Center(
            child: Text(
              headerText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(),
        ),


      ],
    );
  }
}
