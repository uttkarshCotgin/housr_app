import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_utils.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.ctaRedcolor,
      ),
    );
  }
}
