import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarTitleModule extends StatelessWidget {
  String centerIcon;
  Widget? leadingWidget;
  Function()? leadingOnTap;
  Widget? trailingWidget;
  Function()? trailingOnTap;

  AppBarTitleModule({
    Key? key,
    required this.centerIcon,
    this.leadingWidget,
    this.leadingOnTap,
    this.trailingWidget,
    this.trailingOnTap,

  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width * 0.10,
          height: Get.width * 0.10,
          child: GestureDetector(
            onTap: leadingOnTap,
            child: leadingWidget,
          ),
        ),


        Image.asset(
          centerIcon,
          width: Get.width * 0.30,
          height: Get.width * 0.12,
        ),

        SizedBox(
          width: Get.width * 0.10,
          height: Get.width * 0.10,
          child: GestureDetector(
            onTap: trailingOnTap,
            child: trailingWidget,
          ),
        ),
      ],
    );
  }
}
