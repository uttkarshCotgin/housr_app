class UserModel {
  List? data;
  String? msg;

  UserModel({this.data, this.msg});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    msg = json['msg'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['msg'] = msg;
    return data;
  }
}
class UserModelToken {
  StudentData? studentData;
  String? token;
  String? msg;

  UserModelToken({this.token,this.msg});

  UserModelToken.fromJson(Map<String, dynamic> json) {
    studentData = StudentData.fromJson(json['data']?[0]["studentData"]);
    token = json['token'];
    msg = json['msg'];
   
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['data'] = data;
  //   data['token'] = token;
  //   return data;
  // }
}

class StudentData {
  String? sId;
  int? mobile;
  String? email;
  String? bio;
  String? profileImg;
  String? fullname;
  bool? isActive;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  List<EnrolledCourses>? enrolledCourses;

  StudentData(
      {this.sId,
      this.mobile,
      this.email,
      this.bio,
      this.profileImg,
      this.fullname,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp,
        this.enrolledCourses
      });

  StudentData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    email = json['email'];
    bio = json['bio'];
    profileImg = json['profile_img'];
    fullname = json['fullname'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    if (json['enrolledCourses'] != null) {
      enrolledCourses = <EnrolledCourses>[];
      json['enrolledCourses'].forEach((v) {
        enrolledCourses!.add(new EnrolledCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['mobile'] = mobile;
    data['email'] = email;
    data['bio'] = bio;
    data['profile_img'] = profileImg;
    data['fullname'] = fullname;
    data['isActive'] = isActive;
    data['isDelete'] = isDelete;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    if (this.enrolledCourses != null) {
      data['enrolledCourses'] =
          this.enrolledCourses!.map((v) => v.toJson()).toList();
    }


    return data;
  }
}

class EnrolledCourses {
  String? courseId;
  String? courseFieldId;
  String? sId;

  EnrolledCourses({this.courseId, this.courseFieldId, this.sId});

  EnrolledCourses.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    courseFieldId = json['courseFieldId'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['courseFieldId'] = this.courseFieldId;
    data['_id'] = this.sId;
    return data;
  }
}
