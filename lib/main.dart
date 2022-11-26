import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course_list.dart';
import 'package:student_mobile_app/class_models/course_management.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/services/announcement_service.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserManagementViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Courses(),
        ),
        ChangeNotifierProvider(
          create: (context) => CourseManagement(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnnouncementService(),
        )
      ],
      builder: (context, child) {
        ThemeData lightTheme;
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteManager.loadingScreen,
            onGenerateRoute: RouteManager.generateRoute);
      },
    );
  }
}
