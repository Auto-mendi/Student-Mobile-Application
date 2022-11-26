import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/services/helper_announcement.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';
import 'package:tuple/tuple.dart';

import '../services/announcement_service.dart';
import '../widgets/announcement_card.dart';
import '../widgets/app_progress_indicator.dart';
import '../services/helper_user.dart';

class SendAnnouncementsPage extends StatefulWidget {
  const SendAnnouncementsPage({super.key});

  @override
  State<SendAnnouncementsPage> createState() => _SendAnnouncementsPageState();
}

class _SendAnnouncementsPageState extends State<SendAnnouncementsPage> {
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    subtitleController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.purple, Colors.blue],
        //   ),
        // ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            //TODO: refreshTodosInUI(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.save,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () async {
                            //TODO: saveAllTodosInUI(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 30,
                          ),
                          onPressed: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title:
                                      const Text('Send out new announcement'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        decoration: const InputDecoration(
                                            hintText: 'Please enter Title'),
                                        controller: titleController,
                                      ),
                                      TextField(
                                        decoration: const InputDecoration(
                                            hintText:
                                                'Please enter Subtitle (Optional)'),
                                        controller: subtitleController,
                                      ),
                                      TextField(
                                        minLines: 3,
                                        maxLines: 10,
                                        decoration: const InputDecoration(
                                            hintText: 'Please enter Message'),
                                        controller: messageController,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Send'),
                                      onPressed: () async {
                                        sendNewAnnouncementInUI(
                                          context,
                                          titleController: titleController,
                                          subtitleController:
                                              subtitleController,
                                          messageController: messageController,
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.blue,
                            size: 30,
                          ),
                          onPressed: () {
                            lougoutInUI(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Selector<UserManagementViewModel, BackendlessUs>(
                  //     selector: (context, value) => value.currentUser,
                  //     builder: (context, value, child) {
                  //       return value == null
                  //           ? Container()
                  //           : Text(
                  //               '${value.getProperty('name')}\'s Todo list',
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 fontSize: 46,
                  //                 fontWeight: FontWeight.w200,
                  //                 color: Colors.white,
                  //               ),
                  //             );
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: Consumer<AnnouncementService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.announcements.length,
                            itemBuilder: (context, index) {
                              return AnnouncementCard(
                                announcement: value.announcements[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Selector<UserManagementViewModel, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.showUserProgress, value.progressText),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(text: value.item2)
                    : Container();
              },
            ),
            Selector<AnnouncementService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.busyRetrieving, value.busySaving),
              builder: (context, value, child) {
                return value.item1
                    ? const AppProgressIndicator(
                        text:
                            'Busy retrieving data from database...please wait...')
                    : value.item2
                        ? const AppProgressIndicator(
                            text:
                                'Busy saving data to database...please wait...')
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
