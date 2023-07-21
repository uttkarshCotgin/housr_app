import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_utils.dart';
import '../../business_logic/cubits/hotel_cubit/hotel_cubit.dart';


class SearchBarCustom extends StatelessWidget {
  final TextEditingController controller;
   final IconData? suffix;
   final String hintText;
  const SearchBarCustom({super.key, required this.controller, this.suffix, required this.hintText});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  TextFormField(
onChanged: (value){
  context.read<HotelCubit>().fetchHotelData(value);
},
      onFieldSubmitted: (e) async {
        if (e.isNotEmpty) {}
      },
      controller: controller,
      style: const TextStyle(color: AppColor.black,fontSize: 16),
      decoration:  InputDecoration(

        filled: true,

        fillColor: Colors.white.withOpacity(0.65),

      counterText: '',
      
        enabledBorder: const  OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.black,width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        hintText: hintText,
        hintStyle:const TextStyle(
          fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            color: AppColor.subBlack),
        contentPadding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        // focusColor: Colors.white,
        suffixIcon: suffix == null ? null: InkWell(
          onTap: () {},
          child: Icon(
            suffix,
            color: AppColor.menuTab,
          ),
        ),
        focusedBorder:const OutlineInputBorder(

          borderSide: BorderSide(color: AppColor.black,width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        border:InputBorder.none
      ),
    );
  }
}