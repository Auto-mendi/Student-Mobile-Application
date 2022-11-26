import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course.dart';
import 'package:student_mobile_app/class_models/course_list.dart';

const String febit = 'FEBIT';
const String humanities = 'HUMANITIES';
const String management = 'MANAGEMENT';
const String health = 'HEALTH';

class CourseManagement with ChangeNotifier {
  List<String> dropBoxItems = [febit, humanities, health];
  String? selectedItem;
  Course? currentCourse;

  void makeSelection(String item) {
    selectedItem = item;
    notifyListeners();
  }

  void displayCourse(BuildContext context,
      {required String faculty, required String courseCode}) {
    if (faculty == febit) {
      currentCourse = context
          .read<Courses>()
          .courseListFEBIT
          .firstWhere((element) => element.courseCode == courseCode);
    } else if (faculty == humanities) {
      currentCourse = context
          .read<Courses>()
          .courseListHumanites
          .firstWhere((element) => element.courseCode == courseCode);
    }

    notifyListeners();
  }
}
