import 'package:flutter/material.dart';
// import 'package:garb_and_earn_driver/screens/auth_screens/sign_in_screen/sign_in_screen.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Food Delivery Driver - Figma',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Inter",
          ),
          // home: SignInScreen(),
          home: SignUpScreen(),
        );
      },
    );
  }
}
