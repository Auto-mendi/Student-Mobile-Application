class Announcement {
  String title;
  String subtitle;
  String body;
  String? objectId;
  //DateTime time;

  Announcement(
      {required this.title,
      required this.subtitle,
      required this.body,
      this.objectId});

  Map<String, String> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'body': body,
      };

  static Announcement fromJson(Map<dynamic, dynamic>? json) => Announcement(
        title: json!['title'] as String,
        subtitle: json['subtitle'] as String,
        body: json['body'] as String,
        objectId: json['objectId'],
      );
}
