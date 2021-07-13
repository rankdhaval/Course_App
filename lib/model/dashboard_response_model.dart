class DashboardResponseModel {
  String message;
  Data data;

  DashboardResponseModel({this.message, this.data});

  DashboardResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<FeatureCourse> myCourses;
  List<FeatureCourse> featureCourse;
  List<FeatureCourse> completedCourse;

  Data({this.myCourses, this.featureCourse, this.completedCourse});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['my_courses'] != null) {
      myCourses = new List<FeatureCourse>();
      json['my_courses'].forEach((v) {
        myCourses.add(new FeatureCourse.fromJson(v));
      });
    }
    if (json['feature_course'] != null) {
      featureCourse = new List<FeatureCourse>();
      json['feature_course'].forEach((v) {
        featureCourse.add(new FeatureCourse.fromJson(v));
      });
    }
    if (json['completed_course'] != null) {
      completedCourse = new List<FeatureCourse>();
      json['completed_course'].forEach((v) {
        completedCourse.add(new FeatureCourse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myCourses != null) {
      data['my_courses'] = this.myCourses.map((v) => v.toJson()).toList();
    }
    if (this.featureCourse != null) {
      data['feature_course'] =
          this.featureCourse.map((v) => v.toJson()).toList();
    }
    if (this.completedCourse != null) {
      data['completed_course'] =
          this.completedCourse.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeatureCourse {
  int id;
  String name;
  String type;
  int categoryId;
  int difficultyLevel;
  int maximumParticipant;
  int isActive;
  int isFeatureCourse;
  int maximumInstructor;
  String notes;
  String courseBanner;
  String calPaymentType;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;

  FeatureCourse(
      {this.id,
        this.name,
        this.type,
        this.categoryId,
        this.difficultyLevel,
        this.maximumParticipant,
        this.isActive,
        this.isFeatureCourse,
        this.maximumInstructor,
        this.notes,
        this.courseBanner,
        this.calPaymentType,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  FeatureCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    categoryId = json['category_id'];
    difficultyLevel = json['difficulty_level'];
    maximumParticipant = json['maximum_participant'];
    isActive = json['is_active'];
    isFeatureCourse = json['is_feature_course'];
    maximumInstructor = json['maximum_instructor'];
    notes = json['notes'];
    courseBanner = json['course_banner'];
    calPaymentType = json['cal_payment_type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['category_id'] = this.categoryId;
    data['difficulty_level'] = this.difficultyLevel;
    data['maximum_participant'] = this.maximumParticipant;
    data['is_active'] = this.isActive;
    data['is_feature_course'] = this.isFeatureCourse;
    data['maximum_instructor'] = this.maximumInstructor;
    data['notes'] = this.notes;
    data['course_banner'] = this.courseBanner;
    data['cal_payment_type'] = this.calPaymentType;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
