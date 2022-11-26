import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course_list.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';

class InitApp {
  static const String androidApiKey = '1C41F140-3012-4613-982A-6B0D34C49583';
  static const String iosApiKey = 'DA386BBF-8FE8-45B9-A586-779DD193DEAD';
  static const String appID = '72B3A8E4-68B2-4FEB-FF95-A50E55BDA600';

  static void initializeApp(BuildContext context) async {
    await Backendless.initApp(
      applicationId: appID,
      androidApiKey: androidApiKey,
      iosApiKey: iosApiKey,
    );

    //context.read<Courses>().getCourseList();
    context.read<Courses>().getCourseCodes();

    String result =
        await context.read<UserManagementViewModel>().checkIfUserLoggedIn();

    if (result == 'OK') {
      Navigator.popAndPushNamed(context, RouteManager.homePage);
    } else {
      Navigator.popAndPushNamed(context, RouteManager.loginPage);
    }
  }
}
