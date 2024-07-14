import 'dart:convert';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostModel {
  final String type;
  final String? blurHash;
  final String postId;
  final String discription;
  final DateTime postedAt;
  final String thumbnail;
  final String uid;
  final String postUrl;

  final List like;
  final List comments;

  PostModel({
    required this.blurHash,
    required this.type,
    required this.postId,
    required this.discription,
    required this.postedAt,
    required this.thumbnail,
    required this.uid,
    required this.postUrl,
    required this.like,
    required this.comments,
  });

  PostModel copyWith({
    String? blurHash,
    String? type,
    String? username,
    String? postId,
    String? discription,
    DateTime? postedAt,
    String? thumbnail,
    String? uid,
    String? postUrl,
    String? photoUrl,
    List? like,
    List? comments,
  }) {
    return PostModel(
      blurHash: blurHash ?? this.blurHash,
      type: type ?? this.type,
      postId: postId ?? this.postId,
      discription: discription ?? this.discription,
      postedAt: postedAt ?? this.postedAt,
      thumbnail: thumbnail ?? this.thumbnail,
      uid: uid ?? this.uid,
      postUrl: postUrl ?? this.postUrl,
      like: like ?? this.like,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "blurHash": blurHash,
      'type': type,
      'discription': discription,
      'postedAt': postedAt.millisecondsSinceEpoch,
      'thumbnail': thumbnail,
      'uid': uid,
      'postUrl': postUrl,
      'like': like,
      'comments': comments,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      blurHash: map['blurHash'] as String?,
      type: map['type'] as String,
      postId: map['\$id'] as String,
      discription: map['discription'] as String,
      postedAt: DateTime.fromMillisecondsSinceEpoch(map['postedAt'] as int),
      thumbnail: map['thumbnail'] as String,
      uid: map['uid'] as String,
      postUrl: map['postUrl'] as String,
      like: List.from((map['like'] as List)),
      comments: List.from((map['comments'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(type: $type, postId: $postId, discription: $discription, postedAt: $postedAt, thumbnail: $thumbnail, uid: $uid, postUrl: $postUrl, like: $like, comments: $comments)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.postId == postId &&
        other.discription == discription &&
        other.postedAt == postedAt &&
        other.thumbnail == thumbnail &&
        other.uid == uid &&
        other.postUrl == postUrl &&
        listEquals(other.like, like) &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        postId.hashCode ^
        discription.hashCode ^
        postedAt.hashCode ^
        thumbnail.hashCode ^
        uid.hashCode ^
        postUrl.hashCode ^
        like.hashCode ^
        comments.hashCode;
  }
}
