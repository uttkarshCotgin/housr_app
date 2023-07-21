import 'package:flutter/material.dart';
import 'package:housr_app/Theme/theme_data.dart';

import '../../utils/app_utils.dart';

class PlusMinusCounter extends StatefulWidget {
  @override
  _PlusMinusCounterState createState() => _PlusMinusCounterState();
}

class _PlusMinusCounterState extends State<PlusMinusCounter> {
  int _counter = 0;

  // Function to increment the counter
  void _incrementCounter() {
    if(_counter<5) {
      setState(() {
      _counter++;
    });
    }
  }

  // Function to decrement the counter (preventing negative values)
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        // border: Border.all(color:AppColor.ctaRedcolor ),
        borderRadius: BorderRadius.circular(10.0),
       color: AppColor.black.withOpacity(0.75)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Minus Icon Button
            GestureDetector(
              onTap: _decrementCounter,
              child: Container(
                child: Icon(Icons.remove,color:AppColor.white),

              ),
            ),
            SizedBox(width: 5,),
            // Display the current counter value
            Text(
              '$_counter',
              style: myTheme.textTheme.displayLarge?.copyWith(color: AppColor.ctaRedcolor,),
            ),
            SizedBox(width: 5,),
            // Plus Icon Button
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                child: Icon(Icons.add,color: AppColor.white,),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
