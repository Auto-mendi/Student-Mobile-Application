import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/announcement.dart';
import 'package:student_mobile_app/services/helper_announcement.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard(
      {super.key, required this.announcement, bool isAdmin = true});
  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color.fromARGB(255, 197, 230, 248),
        child: Column(children: [
          Text(
            announcement.title,
            style: const TextStyle(fontSize: 25),
          ),
          Text(
            announcement.subtitle,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            announcement.body,
            style: const TextStyle(fontSize: 15),
          ),
          Selector<UserManagementViewModel, bool>(
            selector: (context, value) => value.isAdmin,
            builder: ((context, value, child) {
              return value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              deleteAnnouncementInUI(context,
                                  announcement: announcement);
                            },
                            child: const Text('Delete'))
                      ],
                    )
                  : Container();
            }),
          ),
          const Divider(
            height: 2,
          )
        ]),
      ),
    );
  }
}
