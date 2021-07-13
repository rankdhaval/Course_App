class DashboardParameterModel {
  int page;
  int perPage;
  String search;
  String courseType;

  DashboardParameterModel(
      {this.page, this.perPage, this.search, this.courseType});

  DashboardParameterModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    search = json['search'];
    courseType = json['course_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['perPage'] = this.perPage;
    data['search'] = this.search;
    data['course_type'] = this.courseType;
    return data;
  }
}
