class Course {
  String courseCode;
  String courseName;
  String faculty;
  int nqfLevel;
  List<Map<dynamic, dynamic>> minimumReq;

  Course(
      {required this.courseCode,
      required this.courseName,
      required this.faculty,
      required this.nqfLevel,
      required this.minimumReq});

  static Map<String, dynamic> toJson(Course course) => {
        'courseCode': course.courseCode,
        'courseName': course.courseName,
        'faculty': course.faculty,
        'nqfLevel': course.nqfLevel,
        'minimumReq': course.minimumReq,
      };

  static Course fromJson(Map<dynamic, dynamic>? json) {
    var map = json!['minimumReq']['req'];
    List<Map<dynamic, dynamic>> list = [];

    for (var item in map) {
      list.add(item);
    }
    return Course(
      courseCode: json['courseCode'],
      courseName: json['courseName'],
      faculty: json['faculty'],
      nqfLevel: json['nqfLevel'] as int,
      minimumReq: list,
    );
  }
}
