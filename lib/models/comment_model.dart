import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CommentModel {
  final String uid;
  final String username;
  final String userProPic;
  final DateTime CommentAt;
  final String comentId;
  final String CommentMessage;
  CommentModel({
    required this.uid,
    required this.username,
    required this.userProPic,
    required this.CommentAt,
    required this.comentId,
    required this.CommentMessage,
  });

  CommentModel copyWith({
    String? uid,
    String? username,
    String? userProPic,
    DateTime? CommentAt,
    String? comentId,
    String? CommentMessage,
  }) {
    return CommentModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      userProPic: userProPic ?? this.userProPic,
      CommentAt: CommentAt ?? this.CommentAt,
      comentId: comentId ?? this.comentId,
      CommentMessage: CommentMessage ?? this.CommentMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'userProPic': userProPic,
      'CommentAt': CommentAt.millisecondsSinceEpoch,
      'comentId': comentId,
      'CommentMessage': CommentMessage,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      uid: map['uid'] as String,
      username: map['username'] as String,
      userProPic: map['userProPic'] as String,
      CommentAt: DateTime.fromMillisecondsSinceEpoch(map['CommentAt'] as int),
      comentId: map['comentId'] as String,
      CommentMessage: map['CommentMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(uid: $uid, username: $username, userProPic: $userProPic, CommentAt: $CommentAt, comentId: $comentId, CommentMessage: $CommentMessage)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.username == username &&
        other.userProPic == userProPic &&
        other.CommentAt == CommentAt &&
        other.comentId == comentId &&
        other.CommentMessage == CommentMessage;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        username.hashCode ^
        userProPic.hashCode ^
        CommentAt.hashCode ^
        comentId.hashCode ^
        CommentMessage.hashCode;
  }
}
