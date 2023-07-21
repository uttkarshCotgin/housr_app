import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/hotel/hotel_model.dart';
import '../../../data/repositories/JWT/jwt_token.dart';
import 'booking_state.dart';


List<String> convertListToJson(List<Hotels> myObjectList) {
  List<String> jsonList = myObjectList.map((obj) => jsonEncode(obj)).toList();
  return jsonList;
}
class BookingCubit extends Cubit<BookingState> {
List<Hotels> hotelData =[];
List<String> hotelStringData =[""];
  BookingCubit() : super( BookingInitial());



  void postBooking( Hotels hotelsData) async {
    emit(BookingLoading());
    try {
      hotelData.add(hotelsData);
      hotelStringData.add(hotelsData.id.toString());
      saveListToSharedPreferences(hotelStringData);
      emit(BookingPost(hotelsData));
    } catch (ex) {
      emit(BookingError(ex.toString()));
    }
  }

}
