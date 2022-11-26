import 'package:flutter/material.dart';
import 'package:student_mobile_app/pages/aptitude_page.dart';
import 'package:student_mobile_app/pages/course_recommendation_page.dart';
import 'package:student_mobile_app/pages/home_page.dart';
import 'package:student_mobile_app/pages/loading_screen.dart';
import 'package:student_mobile_app/pages/login_page.dart';
import 'package:student_mobile_app/pages/manage_courses_page.dart';
import 'package:student_mobile_app/pages/register_page.dart';
import 'package:student_mobile_app/pages/send_announcements.dart';
import 'package:student_mobile_app/pages/view_announcements_page.dart';
import 'package:student_mobile_app/pages/view_courses.dart';

class RouteManager {
  static const String loadingScreen = '/';
  static const String homePage = 'homePage';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String viewCourses = '/viewCourses';
  static const String aptitudePage = '/aptitudePage';
  static const String courseRecommendationPage = '/courseRecommendationPage';
  static const String manageCoursesPage = '/mangeCoursesPage';
  static const String sendAnnouncementsPage = '/sendAnnouncementsPage';
  static const String viewAnnouncementsPage = '/viewAnnouncementsPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loadingScreen:
        return MaterialPageRoute(
          builder: (context) => const LoadingScreen(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case viewCourses:
        return MaterialPageRoute(
          builder: (context) => const ViewCourses(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case aptitudePage:
        return MaterialPageRoute(
          builder: (context) => const AptitudePage(),
        );
      case courseRecommendationPage:
        return MaterialPageRoute(
          builder: (context) => const CourseRecommendationPage(),
        );
      case manageCoursesPage:
        return MaterialPageRoute(
          builder: (context) => const ManageCoursesPage(),
        );
      case sendAnnouncementsPage:
        return MaterialPageRoute(
          builder: (context) => const SendAnnouncementsPage(),
        );
      case viewAnnouncementsPage:
        return MaterialPageRoute(
          builder: (context) => const ViewAnnouncementsPage(),
        );
      default:
        throw const FormatException(
            'The Route was not found, kindly check route again');

        builder:
        (context, child) {
          ThemeData lightTheme;
          return const MaterialApp(
              initialRoute: RouteManager.loadingScreen,
              onGenerateRoute: RouteManager.generateRoute);
        };
    }
  }
}
