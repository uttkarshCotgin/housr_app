import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/ui/views/booking/booking_landing.dart';
import 'package:housr_app/ui/views/home/home_screen.dart';
import '../Theme/theme_data.dart';
import '../business_logic/cubits/navigationBar_cubit/navigation_cubit.dart';
import '../data/repositories/JWT/jwt_token.dart';
import '../utils/app_utils.dart';



class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}
List<String?>? hotelData = [];
bool isBG= false;
class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  void didChangeDependencies() async{
    hotelData = await loadListFromSharedPreferences();
    super.didChangeDependencies();
  }

  Map tabs = {
    NavigationBarItem.home : const HomePage(),
    NavigationBarItem.explore: const HomePage(),
    NavigationBarItem.save: const HomePage(),
    NavigationBarItem.booking :  BookingLanding(),
  };

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final navigationCubit = BlocProvider.of<NavigationBarCubit>(context);
    return BlocBuilder<NavigationBarCubit, NavigationBarItem>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor  ,
          body: tabs[state],
          bottomNavigationBar: Container(
            height: 100,
            decoration: const  BoxDecoration(
              // color: Colors.red,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  offset:  Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: BottomNavigationBar(
              iconSize: 25,
              enableFeedback: false,
              backgroundColor:
                  Theme.of(context).navigationBarTheme.backgroundColor,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: myTheme.textTheme.bodySmall
                  ?.copyWith(color: AppColor.subBlack, letterSpacing: 1),
              selectedItemColor: AppColor.ctaButtoncolor,
              selectedIconTheme:
                  const IconThemeData(color: AppColor.ctaButtoncolor),
              unselectedItemColor: Theme.of(context).secondaryHeaderColor,
              currentIndex: navigationCubit.state.index,
              onTap: (index) {


                    final selectedItem = NavigationBarItem.values[index];
                    navigationCubit.selectItem(selectedItem);



              },
              items:const  [
                 BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 0),
                    child: ImageIcon(
                      AssetImage(AppImages.home),
                    ),
                  ),
                  label: 'Home',
                ),
                 BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 0),
                    child: ImageIcon(
                      AssetImage(AppImages.learn),
                    ),
                  ),
                  label: 'Explore',
                ),
                 BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 0),
                    child: ImageIcon(
                      AssetImage(AppImages.live),
                    ),
                  ),
                  label: 'save',
                ),
                 BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 0),
                    child: ImageIcon(
                      AssetImage(AppImages.booking),
                    ),
                  ),
                  label: 'Bookings',
                ),
              ],
            ),
          ));
    });
  }
}
