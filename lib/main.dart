import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:housr_app/routes.dart';


import 'package:housr_app/ui/navigation_bar.dart';
import 'package:housr_app/ui/views/home/home_screen.dart';
import 'package:housr_app/ui/views/login/login_screen.dart';

import 'Theme/theme_data.dart';
import 'business_logic/cubits/counter/booking_cubit.dart';
import 'business_logic/cubits/hotel_cubit/hotel_cubit.dart';
import 'business_logic/cubits/login_cubit/login_cubit.dart';
import 'business_logic/cubits/navigationBar_cubit/navigation_cubit.dart';
import 'data/repositories/JWT/jwt_token.dart';
import 'firebase_options.dart';
bool isLoggedIn = false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  isLoggedIn=(await getJwtFromSharedPreferences() != "");
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Routes _routes = Routes();
    return  MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => LoginCubit(),),
          BlocProvider(
            create: (BuildContext context) => HotelCubit(),),
          BlocProvider(
            create: (context) => NavigationBarCubit(),
          ), BlocProvider(
            create: (context) => BookingCubit(),
          ),
        ],
        child: MaterialApp(
       theme: myTheme,
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    onGenerateRoute: _routes.onGenerateRoute,
    home:isLoggedIn?const CustomNavigationBar(): const LoginScreen())

        );


  }
}


