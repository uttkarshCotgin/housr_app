



import 'package:housr_app/data/models/hotel/hotel_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../business_logic/cubits/counter/booking_cubit.dart';
import '../../../ui/views/booking/booking_landing.dart';

Future<void> saveJwtToSharedPreferences(String jwt) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString('jwt', jwt);
}

Future<String> getJwtFromSharedPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String savedJwt = preferences.getString('jwt')??"";
  return savedJwt;
}
void saveListToSharedPreferences(List<String> myListIndex) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('myListKey', myListIndex);
}


Future<List<String?>?> loadListFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String?>? myListIndex = prefs.getStringList('myListKey');

  return myListIndex;
}



Future<void> removeJwtFromSharedPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('jwt');

}