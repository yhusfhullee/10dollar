import 'dart:convert';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MusicModel {
  final String musicUrl;
  final String musicArt;
  final String uid;
  final List likes;
  final String musictitle;
  final String musicId;
  final DateTime datePublised;
  final String artistName;
  final String musicDiscription;
  final String genre;
  final String featuiring;
  MusicModel({
    required this.musicUrl,
    required this.musicArt,
    required this.uid,
    required this.likes,
    required this.musictitle,
    required this.musicId,
    required this.datePublised,
    required this.artistName,
    required this.musicDiscription,
    required this.genre,
    required this.featuiring,
  });

  MusicModel copyWith({
    String? musicUrl,
    String? musicArtUrl,
    String? uid,
    List? likes,
    String? musictitle,
    String? musicId,
    DateTime? datePublised,
    String? artistName,
    String? musicDiscription,
    String? genre,
    String? featuiring,
  }) {
    return MusicModel(
      musicUrl: musicUrl ?? this.musicUrl,
      musicArt: musicArtUrl ?? this.musicArt,
      uid: uid ?? this.uid,
      likes: likes ?? this.likes,
      musictitle: musictitle ?? this.musictitle,
      musicId: musicId ?? this.musicId,
      datePublised: datePublised ?? this.datePublised,
      artistName: artistName ?? this.artistName,
      musicDiscription: musicDiscription ?? this.musicDiscription,
      genre: genre ?? this.genre,
      featuiring: featuiring ?? this.featuiring,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'musicUrl': musicUrl,
      'musicArt': musicArt,
      'uid': uid,
      'likes': likes,
      'musictitle': musictitle,
      'datePublised': datePublised.millisecondsSinceEpoch,
      'artistName': artistName,
      'musicDiscription': musicDiscription,
      'genre': genre,
      'featuiring': featuiring,
    };
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      musicUrl: map['musicUrl'] as String,
      musicArt: map['musicArt'] as String,
      uid: map['uid'] as String,
      likes: List.from(map['likes'] as List),
      musictitle: map['musictitle'] as String,
      musicId: map['\$id'] as String,
      datePublised:
          DateTime.fromMillisecondsSinceEpoch(map['datePublised'] as int),
      artistName: map['artistName'] as String,
      musicDiscription: map['musicDiscription'] as String,
      genre: map['genre'] as String,
      featuiring: map['featuiring'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) =>
      MusicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MusicModel(musicUrl: $musicUrl, musicArt: $musicArt, uid: $uid, likes: $likes, musictitle: $musictitle, musicId: $musicId, datePublised: $datePublised, artistName: $artistName, musicDiscription: $musicDiscription, genre: $genre, featuiring: $featuiring)';
  }

  @override
  bool operator ==(covariant MusicModel other) {
    if (identical(this, other)) return true;

    return other.musicUrl == musicUrl &&
        other.musicArt == musicArt &&
        other.uid == uid &&
        listEquals(other.likes, likes) &&
        other.musictitle == musictitle &&
        other.musicId == musicId &&
        other.datePublised == datePublised &&
        other.artistName == artistName &&
        other.musicDiscription == musicDiscription &&
        other.genre == genre &&
        other.featuiring == featuiring;
  }

  @override
  int get hashCode {
    return musicUrl.hashCode ^
        musicArt.hashCode ^
        uid.hashCode ^
        likes.hashCode ^
        musictitle.hashCode ^
        musicId.hashCode ^
        datePublised.hashCode ^
        artistName.hashCode ^
        musicDiscription.hashCode ^
        genre.hashCode ^
        featuiring.hashCode;
  }
}
