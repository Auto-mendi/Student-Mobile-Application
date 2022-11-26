import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course_list.dart';
import 'package:student_mobile_app/class_models/course_management.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/services/announcement_service.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lightBlueAccent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(20),
        side: MaterialStateProperty.all(
            const BorderSide(color: Colors.lightGreen)),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(125, 47, 74, 163),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.grey[100],
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.grey));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // primarySwatch: Colors.blue,
  // accentColor: Colors.lightBlueAccent,
  // scaffoldBackgroundColor: Colors.black87,
);

class ThemeSettings with ChangeNotifier {
  final ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;
}
