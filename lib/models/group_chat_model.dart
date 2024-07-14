import 'dart:convert';
import 'package:flutter/foundation.dart';

//ignore_for_file: public_member_api_docs, sort_constructors_first

class GroupChatModel {
  final String groupId;
  final String groupName;
  final String groupProfilePic;
  final String groupDecription;
  final String createdBy;
  final DateTime dateCreated;
  final List Participants;
  final List participantsId;
  final List messageContent;
  final String lastMessage;
  final String lastSender;
  final DateTime timeSent;

  GroupChatModel({
    required this.groupId,
    required this.groupName,
    required this.groupProfilePic,
    required this.groupDecription,
    required this.createdBy,
    required this.dateCreated,
    required this.Participants,
    required this.participantsId,
    required this.messageContent,
    required this.lastMessage,
    required this.lastSender,
    required this.timeSent,
  });

  GroupChatModel copyWith({
    String? groupId,
    String? groupName,
    String? groupProfilePic,
    String? groupDecription,
    String? createdBy,
    DateTime? dateCreated,
    List? Participants,
    List? participantsId,
    List? messageContent,
    String? lastMessage,
    String? lastSender,
    DateTime? timeSent,
  }) {
    return GroupChatModel(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      groupProfilePic: groupProfilePic ?? this.groupProfilePic,
      groupDecription: groupDecription ?? this.groupDecription,
      createdBy: createdBy ?? this.createdBy,
      dateCreated: dateCreated ?? this.dateCreated,
      Participants: Participants ?? this.Participants,
      participantsId: participantsId ?? this.participantsId,
      messageContent: messageContent ?? this.messageContent,
      lastMessage: lastMessage ?? this.lastMessage,
      lastSender: lastSender ?? this.lastSender,
      timeSent: timeSent ?? this.timeSent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groupName': groupName,
      'groupProfilePic': groupProfilePic,
      'groupDecription': groupDecription,
      'createdBy': createdBy,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
      'Participants': Participants,
      'participantsId': participantsId,
      'messageContent': messageContent,
      'lastMessage': lastMessage,
      'lastSender': lastSender,
      'timeSent': timeSent.millisecondsSinceEpoch,
    };
  }

  factory GroupChatModel.fromMap(Map<String, dynamic> map) {
    return GroupChatModel(
      groupId: map['\$id'] as String,
      groupName: map['groupName'] as String,
      groupProfilePic: map['groupProfilePic'] as String,
      groupDecription: map['groupDecription'] as String,
      createdBy: map['createdBy'] as String,
      dateCreated:
          DateTime.fromMillisecondsSinceEpoch(map['dateCreated'] as int),
      Participants: List.from((map['Participants'] as List)),
      participantsId: List.from((map['participantsId'] as List)),
      messageContent: List.from((map['messageContent'] as List)),
      lastMessage: map['lastMessage'] as String,
      lastSender: map['lastSender'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupChatModel.fromJson(String source) =>
      GroupChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroupChatModel(groupId: $groupId, groupName: $groupName, groupProfilePic: $groupProfilePic, groupDecription: $groupDecription, createdBy: $createdBy, dateCreated: $dateCreated, Participants: $Participants, participantsId: $participantsId, messageContent: $messageContent, lastMessage: $lastMessage, lastSender: $lastSender, timeSent: $timeSent)';
  }

  @override
  bool operator ==(covariant GroupChatModel other) {
    if (identical(this, other)) return true;

    return other.groupId == groupId &&
        other.groupName == groupName &&
        other.groupProfilePic == groupProfilePic &&
        other.groupDecription == groupDecription &&
        other.createdBy == createdBy &&
        other.dateCreated == dateCreated &&
        listEquals(other.Participants, Participants) &&
        listEquals(other.participantsId, participantsId) &&
        listEquals(other.messageContent, messageContent) &&
        other.lastMessage == lastMessage &&
        other.lastSender == lastSender &&
        other.timeSent == timeSent;
  }

  @override
  int get hashCode {
    return groupId.hashCode ^
        groupName.hashCode ^
        groupProfilePic.hashCode ^
        groupDecription.hashCode ^
        createdBy.hashCode ^
        dateCreated.hashCode ^
        Participants.hashCode ^
        participantsId.hashCode ^
        messageContent.hashCode ^
        lastMessage.hashCode ^
        lastSender.hashCode ^
        timeSent.hashCode;
  }
}
