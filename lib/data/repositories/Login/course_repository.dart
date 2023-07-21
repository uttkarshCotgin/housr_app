
import 'package:dio/dio.dart';




import '../../models/Login/form_model.dart';
import '../../models/Login/user_model.dart';
import '../../services/api.dart';


class CourseRepository{


  
  Future fetchCourseFromApi(String? jwt) async {
    try {
    APIpost api = APIpost(jwt: jwt ?? "");
    Response response =  await api.sendRequest.post("/api/courses/get/allcourse");
    Map<String,dynamic> postMaps = response.data;

    return FormDataCourse.fromJson(postMaps["data"]);


    } catch (ex) {
      rethrow; 
    }
  }

  Future postCourseApi(String? jwt,Map body) async {
    try {
    APIpost api = APIpost(jwt: jwt ?? "");
    Response response =  await api.sendRequest.post("/api/students/add/enroll/course",data:body);

    Map<String,dynamic> postMaps =  response.data;
    return UserModel.fromJson(postMaps);
    } catch (ex) {

      throw(ex);
    }
  }
  Future deleteCourseApi(String? jwt,Map body) async {
    try {
    APIpost api = APIpost(jwt: jwt ?? "");
    Response response =  await api.sendRequest.post("/api/students/delete/enrolled/course",data:body);
    Map<String,dynamic> postMaps = response.data;
    return postMaps["msg"];

    } catch (ex) {
      rethrow;
    }
  }

  }