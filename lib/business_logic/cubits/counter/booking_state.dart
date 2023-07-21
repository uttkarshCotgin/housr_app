
import '../../../data/models/hotel/hotel_model.dart';




abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}


class BookingPost extends BookingState {
  final Hotels? hotelData;

  BookingPost(this.hotelData);
}
class BookingError extends BookingState {
  final String error;
  BookingError(this.error);
}

