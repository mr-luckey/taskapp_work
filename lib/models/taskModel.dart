class taskModel {
  String? title;
  String? description;
  String? status;
  String? tags;
  String? worktype;
  DateTime? startdatetime;
  DateTime? enddatetime;

  taskModel(
      {this.title,
      this.description,
      this.status,
      this.tags,
      this.worktype,
      this.startdatetime,
      this.enddatetime});

  taskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
    tags = json['tags'];
    worktype = json['worktype'];
    startdatetime = json['startdatetime'];
    enddatetime = json['enddatetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['tags'] = this.tags;
    data['worktype'] = this.worktype;
    data['startdatetime'] = this.startdatetime;
    data['enddatetime'] = this.enddatetime;
    return data;
  }
}
