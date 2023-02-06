import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class AppBarTitleModule extends StatelessWidget {
  final String headerText;
  const AppBarTitleModule({Key? key, required this.headerText}) : super(key: key);

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
              headerText,
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
