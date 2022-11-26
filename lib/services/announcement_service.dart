import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';

import '../class_models/announcement.dart';

class AnnouncementService with ChangeNotifier {
  Announcement? _announcement;

  List<Announcement> _announcements = [];
  List<Announcement> get announcements => _announcements;

  void emptyAnnouncements() {
    _announcements = [];
    notifyListeners();
  }

  bool _busyRetrieving = false;
  bool _busySaving = false;

  bool get busyRetrieving => _busyRetrieving;
  bool get busySaving => _busySaving;

  Future<String> getAnnouncements() async {
    String result = 'OK';
    DataQueryBuilder queryBuilder = DataQueryBuilder();
    //  ..whereClause = "username = '$username'";

    _announcements = [];

    _busyRetrieving = true;
    notifyListeners();

    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('Announcements')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
    });
    if (result != 'OK') {
      _busyRetrieving = false;
      notifyListeners();
      return result;
    }

    if (map != null) {
      if (map.isNotEmpty) {
        for (var announcement in map) {
          announcements.insert(0, Announcement.fromJson(announcement));
        }
      } else {
        emptyAnnouncements();
      }
    } else {
      result = 'NOT OK';
    }

    _busyRetrieving = false;
    notifyListeners();

    return result;
  }

  Future<String> sendAnnouncement(Announcement announcement) async {
    String result = 'OK';

    await Backendless.data
        .of('Announcements')
        .save(announcement.toJson())
        .onError((error, stackTrace) {
      result = error.toString();
      return null;
    });

    return result;
  }

  Future<String> deleteAnnouncement(Announcement announcement) async {
    String result = 'OK';

    await Backendless.data
        .of('Announcments')
        .remove(whereClause: "'title' = ${announcement.title}")
        .onError((error, stackTrace) {
      result = error.toString();
      return null;
    });

    getAnnouncements();
    return result;
  }
}
