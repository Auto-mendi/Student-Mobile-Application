import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course_list.dart';
import 'package:student_mobile_app/widgets/course_card.dart';

class ViewCourses extends StatelessWidget {
  const ViewCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(125, 47, 74, 163),
        body: Consumer<Courses>(
          builder: (context, value, child) {
            context.read<Courses>().getCourseList();
            return value.courseListFEBIT.isEmpty
                ? const Text('Loading')
                : ListView.builder(
                    itemCount: context.read<Courses>().courseListFEBIT.length,
                    itemBuilder: (context, index) {
                      return CourseCard(
                          course:
                              context.read<Courses>().courseListFEBIT[index]);
                    },
                  );
          },
        ));
  }
}
