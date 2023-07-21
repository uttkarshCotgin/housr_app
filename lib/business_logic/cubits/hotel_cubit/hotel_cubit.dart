import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_state.dart';
import 'package:housr_app/data/repositories/hotel/hotel_repo.dart';
import '../../../data/models/hotel/hotel_model.dart';


List<Hotels> searchHotelsByLocation(String location,List<Hotels> hotels,bool isAmenities) {
  // Convert the input location to lowercase for case-insensitive search
  final searchLocation = location.toLowerCase();
  List<Hotels> filteredHotels = !isAmenities?
  // Filter hotels based on the search location
   hotels
      .where((hotel) => (hotel.location?.toLowerCase().contains(searchLocation)??false)||(hotel.name?.toLowerCase().contains(searchLocation)??false))
      .toList():
  hotels
      .where((hotel) => (hotel.amenities?.contains(location)??false))
      .toList();

  return filteredHotels;
}

class HotelCubit extends Cubit<HotelState> {

  HotelCubit() : super(HotelInitial());
  HotelRepository hotelRepository = HotelRepository();
  void fetchHotelData(String search, {bool isAmenities=false}) async {
    emit(HotelLoading());
    try {
      hotelModel response = await hotelRepository.fetchHotelDataFromApi(search);
     List<Hotels> hotelList = searchHotelsByLocation(search,response.hotels??[],isAmenities);
      emit(HotelFetched(hotelList));
    } catch (ex) {
      print(ex);
      emit(HotelError());
      rethrow;
    }
  }
}