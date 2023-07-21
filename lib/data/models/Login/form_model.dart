class FormModel {
  FormDataCourse? data;

  FormModel({this.data});

  FormModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FormDataCourse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FormDataCourse {
  List<SelectYourGoal>? selectYourGoal;
  List<ChooseLanguage>? chooseLanguage;
  List<ChooseLanguage>? selectExamAcademic;

  FormDataCourse({this.selectYourGoal, this.chooseLanguage, this.selectExamAcademic});

  FormDataCourse.fromJson(Map<String, dynamic> json) {
    if (json['selectYourGoal'] != null) {
      selectYourGoal = <SelectYourGoal>[];
      json['selectYourGoal'].forEach((v) {
        selectYourGoal!.add(new SelectYourGoal.fromJson(v));
      });
    }
    if (json['chooseLanguage'] != null) {
      chooseLanguage = <ChooseLanguage>[];
      json['chooseLanguage'].forEach((v) {
        chooseLanguage!.add(new ChooseLanguage.fromJson(v));
      });
    }
    if (json['selectExamAcademic'] != null) {
      selectExamAcademic = <ChooseLanguage>[];
      json['selectExamAcademic'].forEach((v) {
        selectExamAcademic!.add(new ChooseLanguage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selectYourGoal != null) {
      data['selectYourGoal'] =
          this.selectYourGoal!.map((v) => v.toJson()).toList();
    }
    if (this.chooseLanguage != null) {
      data['chooseLanguage'] =
          this.chooseLanguage!.map((v) => v.toJson()).toList();
    }
    if (this.selectExamAcademic != null) {
      data['selectExamAcademic'] =
          this.selectExamAcademic!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class IconName {
  String? sId;
  String? fileUrl;

  IconName({this.sId, this.fileUrl});

  IconName.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}
class SelectYourGoal {
  IconName? iconName;
  String? sId;
  String? name;
  String? descriptions;
  bool? isActive;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<CourseFields>? courseFields;

  SelectYourGoal(
      {this.sId,
        this.name,
        this.iconName,
        this.descriptions,
        this.isActive,
        this.isDelete,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.courseFields});

  SelectYourGoal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    descriptions = json['descriptions'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iconName = json['iconName'] != null
        ? new IconName.fromJson(json['iconName'])
        : null;
    iV = json['__v'];
    if (json['courseFields'] != null) {
      courseFields = <CourseFields>[];
      json['courseFields'].forEach((v) {
        courseFields!.add(new CourseFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['descriptions'] = this.descriptions;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.courseFields != null) {
      data['courseFields'] = this.courseFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseFields {
  String? sId;
  String? name;
  String? courseId;
IconName? iconName;
  bool? isActive;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CourseFields(
      {this.sId,
        this.name,
        this.courseId,
this.iconName,
        this.isActive,
        this.isDelete,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CourseFields.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    courseId = json['courseId'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    iconName = json['iconName'] != null
        ? new IconName.fromJson(json['iconName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['courseId'] = this.courseId;

    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ChooseLanguage {
  String? sId;
  String? name;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ChooseLanguage(
      {this.sId,
        this.name,
        this.isDelete,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ChooseLanguage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isDelete = json['isDelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['isDelete'] = this.isDelete;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
