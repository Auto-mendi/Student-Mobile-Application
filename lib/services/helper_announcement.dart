import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/class_models/announcement.dart';
import 'package:student_mobile_app/services/announcement_service.dart';

void sendNewAnnouncementInUI(
  BuildContext context, {
  required TextEditingController titleController,
  required TextEditingController subtitleController,
  required TextEditingController messageController,
}) async {
  Announcement announcement = Announcement(
      title: titleController.text.trim(),
      subtitle: subtitleController.text.trim(),
      body: messageController.text.trim());
  await context.read<AnnouncementService>().sendAnnouncement(announcement);
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('Announcement sent')));
}

void deleteAnnouncementInUI(BuildContext context,
    {required Announcement announcement}) async {
  await context.read<AnnouncementService>().deleteAnnouncement(announcement);
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('Succesfully deleted')));
}
