
import 'package:dio/dio.dart';


import '../../models/Login/user_model.dart';
import '../../services/api.dart';


class OtpRepository{
   API api = API();
  Future sendOtp(Map body) async {
    try {
    Response response =  await api.sendRequest.post("/api/public/send/otp",data:body);
    Map<String,dynamic> postMaps =  response.data; 
    return UserModel.fromJson(postMaps);
    } catch (ex) {
      rethrow; 
    }
  }
  Future verifyOtp(Map body) async {
    try {
    Response response =  await api.sendRequest.post("/api/public/verify/otp",data:body);
    Map<String,dynamic> postMaps =  response.data; 
    return UserModelToken.fromJson(postMaps); 
    
    } catch (ex) {
      rethrow; 
    }
  }
  }