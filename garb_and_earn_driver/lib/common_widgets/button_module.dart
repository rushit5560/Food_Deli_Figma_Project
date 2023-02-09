import 'package:flutter/material.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:sizer/sizer.dart';


class CommonButtonModule extends StatelessWidget {
  String labelText;
  Color labelTextColor;
  Color bgColor;
  Function()? onTap;

  CommonButtonModule({Key? key, required this.labelText,
  this.labelTextColor = Colors.white,
  this.bgColor = Colors.blue,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
        ),
        child: Center(
          child: Text(
              labelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: labelTextColor,
              fontSize: 14.sp,
            ),
          ).commonSymmetricPadding(vertical: 15),
        ),
      ),
    );
  }
}
