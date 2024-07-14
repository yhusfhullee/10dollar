import 'dart:convert';

import 'package:collection/collection.dart';

class VoteModel {
  final String? question;
  final int endTime;
  final int dateVoteStart;
  final int dateStackStart;
  final List option;
  final List vote;
  final List stakers;
  final int amountstake;
  final int totalToBePay;
  final List winner;
  final List usersId;
  VoteModel({
    required this.question,
    required this.endTime,
    required this.dateVoteStart,
    required this.dateStackStart,
    required this.option,
    required this.vote,
    required this.stakers,
    required this.amountstake,
    required this.totalToBePay,
    required this.winner,
    required this.usersId,
  });

  VoteModel copyWith({
    String? question,
    int? endTime,
    int? dateVoteStart,
    int? dateStackStart,
    List? option,
    List? vote,
    List? stakers,
    int? amountstake,
    int? totalToBePay,
    List? winner,
    List? usersId,
  }) {
    return VoteModel(
      question: question ?? this.question,
      endTime: endTime ?? this.endTime,
      dateVoteStart: dateVoteStart ?? this.dateVoteStart,
      dateStackStart: dateStackStart ?? this.dateStackStart,
      option: option ?? this.option,
      vote: vote ?? this.vote,
      stakers: stakers ?? this.stakers,
      amountstake: amountstake ?? this.amountstake,
      totalToBePay: totalToBePay ?? this.totalToBePay,
      winner: winner ?? this.winner,
      usersId: usersId ?? this.usersId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'endTime': endTime,
      'dateVoteStart': dateVoteStart,
      'dateStackStart': dateStackStart,
      'option': option,
      'vote': vote,
      'stakers': stakers,
      'amountstake': amountstake,
      'totalToBePay': totalToBePay,
      'winner': winner,
      'usersId': usersId,
    };
  }

  factory VoteModel.fromMap(Map<String, dynamic> map) {
    return VoteModel(
      question: map['question'] as String,
      endTime: map['endTime'] as int,
      dateVoteStart: map['dateVoteStart'] as int,
      dateStackStart: map['dateStackStart'] as int,
      option: List.from((map['option'] as List)),
      vote: List.from((map['vote'] as List)),
      stakers: List.from((map['stakers'] as List)),
      amountstake: map['amountstake'] as int,
      totalToBePay: map['totalToBePay'] as int,
      winner: List.from((map['winner'] as List)),
      usersId: List.from((map['usersId'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory VoteModel.fromJson(String source) =>
      VoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VoteModel(question: $question, endTime: $endTime, dateVoteStart: $dateVoteStart, dateStackStart: $dateStackStart, option: $option, vote: $vote, stakers: $stakers, amountstake: $amountstake, totalToBePay: $totalToBePay, winner: $winner, usersId: $usersId)';
  }

  @override
  bool operator ==(covariant VoteModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.question == question &&
        other.endTime == endTime &&
        other.dateVoteStart == dateVoteStart &&
        other.dateStackStart == dateStackStart &&
        listEquals(other.option, option) &&
        listEquals(other.vote, vote) &&
        listEquals(other.stakers, stakers) &&
        other.amountstake == amountstake &&
        other.totalToBePay == totalToBePay &&
        listEquals(other.winner, winner) &&
        listEquals(other.usersId, usersId);
  }

  @override
  int get hashCode {
    return question.hashCode ^
        endTime.hashCode ^
        dateVoteStart.hashCode ^
        dateStackStart.hashCode ^
        option.hashCode ^
        vote.hashCode ^
        stakers.hashCode ^
        amountstake.hashCode ^
        totalToBePay.hashCode ^
        winner.hashCode ^
        usersId.hashCode;
  }
}

class Option {
  final String? blurHash;
  final String videoLink;
  final String optionId;
  final String uid;
  final String caption;
  final String thumbnail;
  final String percent;
  final List voters;
  final List comments;
  final List likes;

  Option({
    required this.blurHash,
    required this.videoLink,
    required this.optionId,
    required this.uid,
    required this.caption,
    required this.thumbnail,
    required this.percent,
    required this.voters,
    required this.comments,
    required this.likes,
  });

  Option copyWith({
    String? blurHash,
    String? videoLink,
    String? optionId,
    String? uid,
    String? caption,
    String? thumbnail,
    String? percent,
    List? voters,
    List? comments,
    List? likes,
  }) {
    return Option(
      blurHash: blurHash ?? this.blurHash,
      videoLink: videoLink ?? this.videoLink,
      optionId: optionId ?? this.optionId,
      uid: uid ?? this.uid,
      caption: caption ?? this.caption,
      thumbnail: thumbnail ?? this.thumbnail,
      percent: percent ?? this.percent,
      voters: voters ?? this.voters,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "blurHash": blurHash,
      'videoLink': videoLink,
      'uid': uid,
      'caption': caption,
      'thumbnail': thumbnail,
      'percent': percent,
      'voters': voters,
      'comments': comments,
      'likes': likes,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      blurHash: map['blurHash'] as String?,
      videoLink: map['videoLink'] as String,
      optionId: map['\$id'] as String,
      uid: map['uid'] as String,
      caption: map['caption'] as String,
      thumbnail: map['thumbnail'] as String,
      percent: map['percent'] as String,
      voters: List.from(map['voters'] as List),
      comments: List.from(map['comments'] as List),
      likes: List.from(map['likes'] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) =>
      Option.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Option(videoLink: $videoLink, optionId: $optionId, uid: $uid, caption: $caption, thumbnail: $thumbnail, percent: $percent, voters: $voters, comments: $comments, likes: $likes)';
  }

  @override
  bool operator ==(covariant Option other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.videoLink == videoLink &&
        other.optionId == optionId &&
        other.uid == uid &&
        other.caption == caption &&
        other.thumbnail == thumbnail &&
        other.percent == percent &&
        listEquals(other.voters, voters) &&
        listEquals(other.comments, comments) &&
        listEquals(other.likes, likes);
  }

  @override
  int get hashCode {
    return videoLink.hashCode ^
        optionId.hashCode ^
        uid.hashCode ^
        caption.hashCode ^
        thumbnail.hashCode ^
        percent.hashCode ^
        voters.hashCode ^
        comments.hashCode ^
        likes.hashCode;
  }
}
