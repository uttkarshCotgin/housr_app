class ProfileModel {
  ProfileData? data;
  String? msg;
  ProfileModel({this.data,this.msg});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'][0] != null ?  ProfileData.fromJson(json['data'][0]) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }
}

class ProfileData {
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
  AcademicId? academicId;

  List<EnrolledCourses>? enrolledCourses;


  ProfileData(
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
        this.academicId,

        this.enrolledCourses,
        });

  ProfileData.fromJson(Map<String, dynamic> json) {
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
    academicId = json['academicId'] != null
        ? new AcademicId.fromJson(json['academicId'])
        : null;

    if (json['enrolledCourses'] != null) {
      enrolledCourses = <EnrolledCourses>[];
      json['enrolledCourses'].forEach((v) {
        enrolledCourses?.add(new EnrolledCourses.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['profile_img'] = this.profileImg;
    data['fullname'] = this.fullname;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.academicId != null) {
      data['academicId'] = this.academicId?.toJson();
    }

    if (this.enrolledCourses != null) {
      data['enrolledCourses'] =
          this.enrolledCourses?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class AcademicId {
  String? sId;
  String? name;

  AcademicId({this.sId, this.name});

  AcademicId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class EnrolledCourses {
  String? courseId;
  String? courseFieldId;
  String? sId;
  bool? isSelected;

  EnrolledCourses({this.courseId, this.courseFieldId, this.sId,this.isSelected});

  EnrolledCourses.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    courseFieldId = json['courseFieldId'];
    sId = json['_id'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['courseFieldId'] = this.courseFieldId;
    data['isSelected'] = this.isSelected;
    data['_id'] = this.sId;
    return data;
  }
}
