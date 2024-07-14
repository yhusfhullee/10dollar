import 'dart:convert';
import '../enum/notificton_type_enum.dart';

//ignore_for_file: public_member_api_docs, sort_constructors_first

class NotificationModel {
  final String text;
  final String postId;
  final String id;
  final String uid;
  final DateTime time;
  final bool isSeen;
  final NotificationType notificationType;
  NotificationModel({
    required this.isSeen,
    required this.text,
    required this.postId,
    required this.id,
    required this.uid,
    required this.time,
    required this.notificationType,
  });

  NotificationModel copyWith({
    bool? isSeen,
    String? text,
    String? postId,
    String? id,
    String? uid,
    DateTime? time,
    NotificationType? notificationType,
  }) {
    return NotificationModel(
      isSeen: isSeen ?? this.isSeen,
      text: text ?? this.text,
      postId: postId ?? this.postId,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      time: time ?? this.time,
      notificationType: notificationType ?? this.notificationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSeen': isSeen,
      'text': text,
      'postId': postId,
      'uid': uid,
      'time': time.millisecondsSinceEpoch,
      'notificationType': notificationType.type,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      isSeen: map['isSeen'] as bool,
      text: map['text'] as String,
      postId: map['postId'] as String,
      id: map['\$id'] as String,
      uid: map['uid'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      notificationType:
          (map['notificationType'] as String).toNotificationTypeEnum(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(isSeen: $isSeen, text: $text, postId: $postId, id: $id, uid: $uid, time: $time, notificationType: $notificationType)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.postId == postId &&
        other.id == id &&
        other.uid == uid &&
        other.time == time &&
        other.notificationType == notificationType;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        postId.hashCode ^
        id.hashCode ^
        uid.hashCode ^
        time.hashCode ^
        notificationType.hashCode;
  }
}
