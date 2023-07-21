
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:housr_app/data/models/hotel/hotel_model.dart';

import '../../../mockApi/hotel_data.dart';




class HotelRepository{



  Future fetchHotelDataFromApi(String search,{bool isAmenities=false}) async {
    try {

      Map<String,dynamic> postMaps = hotelData;
      // postMaps.assign("search",search);

      return hotelModel.fromJson(postMaps);


    } catch (ex) {
      rethrow;
    }
  }



}