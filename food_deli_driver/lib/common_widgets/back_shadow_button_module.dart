import 'package:flutter/material.dart';


class BackShadowButtonModule extends StatelessWidget {
  Icon? icon;
  double? blurRadius;
  Function()? onTap;
  BackShadowButtonModule({Key? key, this.icon, this.onTap, this.blurRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurStyle: BlurStyle.outer,
              blurRadius: blurRadius ?? 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          // child: Icon(Icons.arrow_back_ios_new_rounded),
          child: icon ?? Container(),
        ),
      ),
    );
  }
}
