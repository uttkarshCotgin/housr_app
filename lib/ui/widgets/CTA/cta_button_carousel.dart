import 'package:flutter/material.dart';

import '../../../utils/app_utils.dart';


class CtaCarouselButton extends StatelessWidget {
  final String title;
  final bool isEnable;
  final TextStyle? textStyle;
  final Color color;
  final double height;
  final GestureTapCallback onPressed;
  const CtaCarouselButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.isEnable, this.color = AppColor.black,  this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), this.height = 50});

  @override
    Widget build(BuildContext context) {

 TextTheme textTheme = Theme.of(context).textTheme;
 return ElevatedButton(

      style: ElevatedButton.styleFrom(

        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),

        backgroundColor: isEnable ? color : AppColor.black,

        minimumSize:  Size.fromHeight(height), // NEW
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
