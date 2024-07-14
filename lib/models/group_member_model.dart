import 'dart:convert';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GroupMemberModel {
  final String userName;
  final String uid;
  final String profile;
  final bool isAdmin;
  final List unread;
  GroupMemberModel({
    required this.userName,
    required this.uid,
    required this.profile,
    required this.isAdmin,
    required this.unread,
  });

  GroupMemberModel copyWith({
    String? userName,
    String? uid,
    String? profile,
    bool? isAdmin,
    List? unread,
  }) {
    return GroupMemberModel(
      userName: userName ?? this.userName,
      uid: uid ?? this.uid,
      profile: profile ?? this.profile,
      isAdmin: isAdmin ?? this.isAdmin,
      unread: unread ?? this.unread,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'uid': uid,
      'profile': profile,
      'isAdmin': isAdmin,
      'unread': unread,
    };
  }

  factory GroupMemberModel.fromMap(Map<String, dynamic> map) {
    return GroupMemberModel(
      userName: map['userName'] as String,
      uid: map['uid'] as String,
      profile: map['profile'] as String,
      isAdmin: map['isAdmin'] as bool,
      unread: List.from((map['unread'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupMemberModel.fromJson(String source) =>
      GroupMemberModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroupMemberModel(userName: $userName, uid: $uid, profile: $profile, isAdmin: $isAdmin, unread: $unread)';
  }

  @override
  bool operator ==(covariant GroupMemberModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.uid == uid &&
        other.profile == profile &&
        other.isAdmin == isAdmin &&
        listEquals(other.unread, unread);
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        uid.hashCode ^
        profile.hashCode ^
        isAdmin.hashCode ^
        unread.hashCode;
  }
}
