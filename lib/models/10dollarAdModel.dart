import 'dart:convert';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AdsModel {
  final String type;
  final String header;
  final String? blurHash;
  final String adsId;
  final String discription;
  final DateTime postedAt;
  final String thumbnail;
  final String uid;
  final String postUrl;
  final String photoUrl;
  final bool isShow;
  final List like;
  final List Reply;
  AdsModel({
    required this.type,
    required this.header,
    required this.blurHash,
    required this.adsId,
    required this.discription,
    required this.postedAt,
    required this.thumbnail,
    required this.uid,
    required this.postUrl,
    required this.photoUrl,
    required this.isShow,
    required this.like,
    required this.Reply,
  });

  AdsModel copyWith({
    String? type,
    String? header,
    String? blurHash,
    String? adsId,
    String? discription,
    DateTime? postedAt,
    String? thumbnail,
    String? uid,
    String? postUrl,
    String? photoUrl,
    bool? isShow,
    List? like,
    List? Reply,
  }) {
    return AdsModel(
      type: type ?? this.type,
      header: header ?? this.header,
      blurHash: blurHash ?? this.blurHash,
      adsId: adsId ?? this.adsId,
      discription: discription ?? this.discription,
      postedAt: postedAt ?? this.postedAt,
      thumbnail: thumbnail ?? this.thumbnail,
      uid: uid ?? this.uid,
      postUrl: postUrl ?? this.postUrl,
      photoUrl: photoUrl ?? this.photoUrl,
      isShow: isShow ?? this.isShow,
      like: like ?? this.like,
      Reply: Reply ?? this.Reply,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'header': header,
      'blurHash': blurHash,
      'discription': discription,
      'postedAt': postedAt.millisecondsSinceEpoch,
      'thumbnail': thumbnail,
      'uid': uid,
      'postUrl': postUrl,
      'photoUrl': photoUrl,
      'isShow': isShow,
      'like': like,
      'Reply': Reply,
    };
  }

  factory AdsModel.fromMap(Map<String, dynamic> map) {
    return AdsModel(
      type: map['type'] as String,
      header: map['header'] as String,
      blurHash: map['blurHash'] as String?,
      adsId: map['\$id'] as String,
      discription: map['discription'] as String,
      postedAt: DateTime.fromMillisecondsSinceEpoch(map['postedAt'] as int),
      thumbnail: map['thumbnail'] as String,
      uid: map['uid'] as String,
      postUrl: map['postUrl'] as String,
      photoUrl: map['photoUrl'] as String,
      isShow: map['isShow'] as bool,
      like: List.from((map['like'] as List)),
      Reply: List.from((map['Reply'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdsModel.fromJson(String source) =>
      AdsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdsModel(type: $type, header: $header, blurHash: $blurHash, adsId: $adsId, discription: $discription, postedAt: $postedAt, thumbnail: $thumbnail, uid: $uid, postUrl: $postUrl, photoUrl: $photoUrl, isShow: $isShow, like: $like, Reply: $Reply)';
  }

  @override
  bool operator ==(covariant AdsModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.header == header &&
        other.blurHash == blurHash &&
        other.adsId == adsId &&
        other.discription == discription &&
        other.postedAt == postedAt &&
        other.thumbnail == thumbnail &&
        other.uid == uid &&
        other.postUrl == postUrl &&
        other.photoUrl == photoUrl &&
        other.isShow == isShow &&
        listEquals(other.like, like) &&
        listEquals(other.Reply, Reply);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        header.hashCode ^
        blurHash.hashCode ^
        adsId.hashCode ^
        discription.hashCode ^
        postedAt.hashCode ^
        thumbnail.hashCode ^
        uid.hashCode ^
        postUrl.hashCode ^
        photoUrl.hashCode ^
        isShow.hashCode ^
        like.hashCode ^
        Reply.hashCode;
  }
}
