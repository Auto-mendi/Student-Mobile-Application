import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course.dart';

import '../class_models/course_management.dart';
import '../miscellaneous/constants.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key, required this.course, bool adminControls = false});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(69, 6, 202, 192),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                Positioned(
                    child: Text(
                  course.courseName,
                  style: TextStyle(color: Colors.white),
                )),
                Positioned(
                  right: 2.0,
                  child: Text(
                    'NQF: ${course.nqfLevel.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          const Text(
            'Minimum Requirements',
            style: TextStyle(color: Colors.white),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: course.minimumReq.length,
          //   itemBuilder: (context, index) {
          //     return Text(course.minimumReq[index]['subject']);
          //   },
          // ),
          // const Text('Minimum Requirements'),
          Center(
            child: Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.lightGreen)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(125, 47, 74, 163),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Delete',
                  ),
                ),
                const SizedBox(
                  width: 15,
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(context
                                .read<CourseManagement>()
                                .currentCourse!
                                .courseCode),
                            const Text('Course Name'),
                            TextFormField(
                              decoration:
                                  formDecoration('', iconData: Icons.abc),
                            ),
                            const Text('Department'),
                            TextFormField(),
                            const Text('NQF Level'),
                            TextFormField(),
                          ],
                        ));
                      },
                    );
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
