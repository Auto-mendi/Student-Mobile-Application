import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/services/announcement_service.dart';
import 'package:student_mobile_app/services/helper_user.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserManagementViewModel>().checkIfAdmin();
    return Scaffold(
        backgroundColor: const Color.fromARGB(125, 47, 74, 163),
        appBar: AppBar(
          title: const Text("Student Mobile App"),
          actions: [
            IconButton(
                onPressed: () {
                  lougoutInUI(context);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(125, 47, 74, 163),
        ),
        body: Selector<UserManagementViewModel, bool>(
          selector: (context, value) => value.isAdmin,
          builder: (context, value, child) {
            return value
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteManager.manageCoursesPage);
                        },
                        child: const Text('Manage Courses'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<AnnouncementService>()
                              .getAnnouncements();
                          Navigator.pushNamed(
                              context, RouteManager.sendAnnouncementsPage);
                        },
                        child: const Text('Send Announcemets'),
                      ),
                    ],
                  ))
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage("assets/images/logo.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 60),
                        ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.lightGreen)),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(125, 47, 74, 163),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteManager.viewCourses);
                          },
                          child: const Text('View Courses'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.lightGreen)),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(125, 47, 74, 163),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteManager.aptitudePage);
                          },
                          child: const Text('Take Aptitude Test'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.lightGreen)),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(125, 47, 74, 163),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteManager.courseRecommendationPage);
                          },
                          child: const Text('Enter Subjects'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.lightGreen)),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(125, 47, 74, 163),
                            ),
                          ),
                          onPressed: () {
                            context
                                .read<AnnouncementService>()
                                .getAnnouncements();
                            Navigator.pushNamed(
                                context, RouteManager.viewAnnouncementsPage);
                          },
                          child: const Text('View Announcements'),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}
