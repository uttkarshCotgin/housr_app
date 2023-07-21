// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class tags extends StatelessWidget {
  final Color color;
  final String text;
  const tags({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
     Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Text(
            text.toUpperCase(),
            style: textTheme.bodySmall
                ?.copyWith(color: color, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
