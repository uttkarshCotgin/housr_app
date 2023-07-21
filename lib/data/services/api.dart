import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class API{
  final Dio _dio = Dio();

  API(){
    _dio.options.baseUrl = "http://65.2.39.125:4000";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio; 

}

class APIpost{
  String jwt;
  final Dio _dio = Dio();
  


  APIpost({required this.jwt}){
    _dio.options.baseUrl = "http://65.2.39.125:4000";
    _dio.options.headers = {"x-auth-token":jwt};
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio; 

}
