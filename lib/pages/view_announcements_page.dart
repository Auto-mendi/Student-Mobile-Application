import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/services/announcement_service.dart';
import 'package:student_mobile_app/widgets/announcement_card.dart';

class ViewAnnouncementsPage extends StatelessWidget {
  const ViewAnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AnnouncementService>(
        builder: (context, value, child) {
          return Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.announcements.length,
              reverse: true,
              itemBuilder: (context, index) =>
                  AnnouncementCard(announcement: value.announcements[index]),
            ),
          );
        },
      ),
    );
  }
}
