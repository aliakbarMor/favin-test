class Class {
  String? classNumber;
  String? className;
  String? description;
  String? registrationTime;

  Class(
    this.classNumber,
    this.className,
    this.description,
    this.registrationTime,
  );

  Class.fromJson(Map<String, dynamic> json) {
    classNumber = json['classNumber'];
    className = json['activityclassName'];
    description = json['description'];
    registrationTime = json['registrationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['classNumber'] = classNumber;
    data['activityclassName'] = className;
    data['description'] = description;
    data['registrationTime'] = registrationTime;
    return data;
  }
}
