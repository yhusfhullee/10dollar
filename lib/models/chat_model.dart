import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MessageModel {
  final String chatId;
  final String friendId;
  final String userId;
  final List messageContent;
  final List unRead;
  final String lastMessage;
  final String lastSenderId;
  final DateTime timeSent;
  MessageModel({
    required this.chatId,
    required this.friendId,
    required this.userId,
    required this.messageContent,
    required this.unRead,
    required this.lastMessage,
    required this.lastSenderId,
    required this.timeSent,
  });

  MessageModel copyWith({
    String? chatId,
    String? friendId,
    String? userId,
    List? messageContent,
    List? unRead,
    String? lastMessage,
    String? lastSenderId,
    DateTime? timeSent,
  }) {
    return MessageModel(
      chatId: chatId ?? this.chatId,
      friendId: friendId ?? this.friendId,
      userId: userId ?? this.userId,
      messageContent: messageContent ?? this.messageContent,
      unRead: unRead ?? this.unRead,
      lastMessage: lastMessage ?? this.lastMessage,
      lastSenderId: lastSenderId ?? this.lastSenderId,
      timeSent: timeSent ?? this.timeSent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'friendId': friendId,
      'userId': userId,
      'messageContent': messageContent,
      'unRead': unRead,
      'lastMessage': lastMessage,
      'lastSenderId': lastSenderId,
      'timeSent': timeSent.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      chatId: map['\$id'] as String,
      friendId: map['friendId'] as String,
      userId: map['userId'] as String,
      messageContent: List.from((map['messageContent'] as List)),
      unRead: List.from((map['unRead'] as List)),
      lastMessage: map['lastMessage'] as String,
      lastSenderId: map['lastSenderId'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(chatId: $chatId, friendId: $friendId, userId: $userId, messageContent: $messageContent, unRead: $unRead, lastMessage: $lastMessage, lastSenderId: $lastSenderId, timeSent: $timeSent)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.chatId == chatId &&
        other.friendId == friendId &&
        other.userId == userId &&
        listEquals(other.messageContent, messageContent) &&
        listEquals(other.unRead, unRead) &&
        other.lastMessage == lastMessage &&
        other.lastSenderId == lastSenderId &&
        other.timeSent == timeSent;
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
        friendId.hashCode ^
        userId.hashCode ^
        messageContent.hashCode ^
        unRead.hashCode ^
        lastMessage.hashCode ^
        lastSenderId.hashCode ^
        timeSent.hashCode;
  }
}
