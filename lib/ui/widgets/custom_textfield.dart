// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/app_utils.dart';



class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final Function onSubmitted;
   final IconData? suffix;
   final String hintText;
   const CustomTextfield({
    Key? key,
    required this.controller,
     required this.suffix, required this.hintText, required this.onChanged, required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return
    TextFormField(

      onChanged: (number){

onChanged();

      },

      onFieldSubmitted: (e) async {
        if (e.isNotEmpty) {
          onSubmitted();
        }
      },
      controller: controller,
      maxLength: 10,
      keyboardType: TextInputType.number,
      style: textTheme.displaySmall?.copyWith(color: AppColor.white),
      decoration:  InputDecoration(
        filled: true,
        fillColor: AppColor.black.withOpacity(0.50),

      counterText: '',
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

       const  Padding(
           padding:  EdgeInsets.fromLTRB(13,13,8,13),
           child:  Text("+91",style: TextStyle(color:AppColor.white,fontSize: 16,fontWeight: FontWeight.w600 ),),
         ),
           Padding(
             padding: const EdgeInsets.only(right: 8.0),
             child: Container(
              width: 1,
              height: 20,
              color: AppColor.white,
                     ),
           ),
          

        ],),
      
        enabledBorder: const  OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        hintText: hintText,
        hintStyle:const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColor.white),
        contentPadding:const EdgeInsets.symmetric(horizontal: 10),
        // focusColor: Colors.white,
        suffixIcon: suffix == null ? null: InkWell(
          onTap: () {},
          child: Icon(
            suffix,
            color: AppColor.borderColor,
          ),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        border:const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
      ),
    );
  }
}
