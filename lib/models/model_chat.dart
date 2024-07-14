import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChatModel {
  final String messageContent;
  final String caption;
  final String type;
  final DateTime timeSent;
  final String SenderId;
  final String replyTo;
  final List react;

  ChatModel({
    required this.messageContent,
    required this.caption,
    required this.type,
    required this.timeSent,
    required this.SenderId,
    required this.replyTo,
    required this.react,
  });

  ChatModel copyWith({
    String? messageContent,
    String? caption,
    String? type,
    DateTime? timeSent,
    String? SenderId,
    String? replyTo,
    List? react,
  }) {
    return ChatModel(
      messageContent: messageContent ?? this.messageContent,
      caption: caption ?? this.caption,
      type: type ?? this.type,
      timeSent: timeSent ?? this.timeSent,
      SenderId: SenderId ?? this.SenderId,
      replyTo: replyTo ?? this.replyTo,
      react: react ?? this.react,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageContent': messageContent,
      'caption': caption,
      'type': type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'SenderId': SenderId,
      'replyTo': replyTo,
      'react': react,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      messageContent: map['messageContent'] as String,
      caption: map['caption'] as String,
      type: map['type'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      SenderId: map['SenderId'] as String,
      replyTo: map['replyTo'] as String,
      react: List.from((map['react'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatModel(messageContent: $messageContent, caption: $caption, type: $type, timeSent: $timeSent, SenderId: $SenderId, replyTo: $replyTo, react: $react)';
  }

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;

    return other.messageContent == messageContent &&
        other.caption == caption &&
        other.type == type &&
        other.timeSent == timeSent &&
        other.SenderId == SenderId &&
        other.replyTo == replyTo &&
        listEquals(other.react, react);
  }

  @override
  int get hashCode {
    return messageContent.hashCode ^
        caption.hashCode ^
        type.hashCode ^
        timeSent.hashCode ^
        SenderId.hashCode ^
        replyTo.hashCode ^
        react.hashCode;
  }
}
