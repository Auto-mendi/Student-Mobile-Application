import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/course_list.dart';
import 'package:student_mobile_app/class_models/course_management.dart';
import 'package:student_mobile_app/widgets/course_card.dart';
import 'package:tuple/tuple.dart';

class ManageCoursesPage extends StatefulWidget {
  const ManageCoursesPage({super.key});

  @override
  State<ManageCoursesPage> createState() => _ManageCoursesPageState();
}

class _ManageCoursesPageState extends State<ManageCoursesPage> {
  String myCourseCode = '';
  String myfaculty = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<CourseManagement, Tuple2<List<String>, String?>>(
              selector: (context, value) =>
                  Tuple2(value.dropBoxItems, value.selectedItem),
              builder: (context, value, child) {
                return SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    hint: const Text('Faculty'),
                    value: value.item2,
                    items: value.item1
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (item) {
                      myfaculty = item!;
                      context.read<CourseManagement>().makeSelection(item);
                      context.read<Courses>().facultyFilter(faculty: item);
                    },
                  ),
                );
              },
            ),
            //TODO: Maybe do not use Consumer
            Consumer<Courses>(
              builder: (context, value, child) {
                return Autocomplete<String>(
                  onSelected: (option) {},
                  optionsBuilder: ((textEditingValue) {
                    myCourseCode = textEditingValue.text;
                    if (textEditingValue.text == '') {
                      return const Iterable.empty();
                    }
                    return value.courseCodeList.where(
                      (element) {
                        return element.contains(textEditingValue.text);
                      },
                    );
                  }),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CourseManagement>().displayCourse(context,
                    faculty: myfaculty, courseCode: myCourseCode);
              },
              child: const Text('Search'),
            ),
            Consumer<CourseManagement>(
              builder: (context, value, child) {
                return value.currentCourse != null
                    ? CourseCard(
                        course: value.currentCourse!,
                        adminControls: true,
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
