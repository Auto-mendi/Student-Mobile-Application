import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:student_mobile_app/class_models/course.dart';
import 'package:student_mobile_app/class_models/course_management.dart';

class Courses with ChangeNotifier {
  List<Course> courseListFEBIT = [];
  List<Course> courseListHumanites = [];
  List<Course> courseListManagement = [];
  List<Course> courseListHealthAndEnvSci = [];

  List<String> courseCodeList = [];

  Future<String> facultyFilter({String faculty = 'all'}) async {
    String result = 'OK';

    if (faculty == febit) {
      courseCodeList = [];
      for (Course course in courseListFEBIT) {
        courseCodeList.add(course.courseCode.toString());
      }
    } else if (faculty == humanities) {
      courseCodeList = [];
      for (Course course in courseListHumanites) {
        courseCodeList.add(course.courseCode.toString());
      }
    } else if (faculty == management) {
      courseCodeList = [];
      for (Course course in courseListManagement) {
        courseCodeList.add(course.courseCode.toString());
      }
    } else if (faculty == health) {
      courseCodeList = [];
      for (Course course in courseListHealthAndEnvSci) {
        courseCodeList.add(course.courseCode.toString());
      }
    }
    notifyListeners();

    return result;
  }

  Future<String> getCourseCodes({String faculty = 'all'}) async {
    String result = 'OK';

    await getCourseList();

    for (Course course in courseListFEBIT) {
      courseCodeList.add(course.courseCode.toString());
    }
    notifyListeners();
    return result;
  }

  Future<String> getCourseList() async {
    DataQueryBuilder queryBuilder = DataQueryBuilder();
    String result = 'OK';

    var mapFEBIT = await Backendless.data
        .of('FEBIT')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
      return null;
    });
    courseListFEBIT = [];
    if (mapFEBIT != null) {
      if (mapFEBIT.isNotEmpty) {
        for (var course in mapFEBIT) {
          courseListFEBIT.add(Course.fromJson(course));
        }
      }
    }

    var mapHumanities = await Backendless.data
        .of('Faculty_of_Humanities')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
      return null;
    });

    if (mapHumanities != null) {
      if (mapHumanities.isNotEmpty) {
        for (var course in mapHumanities) {
          courseListHumanites.add(Course.fromJson(course));
        }
      }
    }

    var mapManagement = await Backendless.data
        .of('Faculty_of_Management_Sciences')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
      return null;
    });

    if (mapManagement != null) {
      if (mapManagement.isNotEmpty) {
        for (var course in mapManagement) {
          courseListManagement.add(Course.fromJson(course));
        }
      }
    }
    notifyListeners();

    return result;
  }

  Future<String> updateCourse(Course course) async {
    String result = '';

    await Backendless.data
        .of('FEBIT')
        .update("courseCode = ${course.courseCode}", Course.toJson(course))
        .onError((error, stackTrace) {
      result = error.toString();
    });

    return result;
  }
}
