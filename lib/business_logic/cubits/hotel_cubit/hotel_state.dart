import '../../../data/models/hotel/hotel_model.dart';

abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}
class HotelError extends HotelState {}

class HotelFetched extends HotelState {
  final List<Hotels> hotelList;
  HotelFetched( this.hotelList);
}



