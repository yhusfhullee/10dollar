import 'dart:convert';

class VideoModel {
  final String videoId;
  final String caption;
  final String? blurHash;
  final String uid;
  final String videoUrl;
  final String thumbnail;
  final DateTime postedAt;
  VideoModel({
    required this.blurHash,
    required this.videoId,
    required this.caption,
    required this.uid,
    required this.videoUrl,
    required this.thumbnail,
    required this.postedAt,
  });

  VideoModel copyWith({
    String? blurHash,
    String? videoId,
    String? caption,
    String? uid,
    List? like,
    String? videoUrl,
    String? thumbnail,
    DateTime? postedAt,
  }) {
    return VideoModel(
      blurHash: blurHash ?? this.blurHash,
      videoId: videoId ?? this.videoId,
      caption: caption ?? this.caption,
      uid: uid ?? this.uid,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnail: thumbnail ?? this.thumbnail,
      postedAt: postedAt ?? this.postedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "blurHash": blurHash,
      'caption': caption,
      'uid': uid,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'postedAt': postedAt.millisecondsSinceEpoch,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      blurHash: map['blurHash'] as String?,
      videoId: map['\$id'] as String,
      caption: map['caption'] as String,
      uid: map['uid'] as String,
      videoUrl: map['videoUrl'] as String,
      thumbnail: map['thumbnail'] as String,
      postedAt: DateTime.fromMillisecondsSinceEpoch(map['postedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VideoModel(videoId: $videoId, caption: $caption, uid: $uid, videoUrl: $videoUrl, thumbnail: $thumbnail, postedAt: $postedAt)';
  }

  @override
  bool operator ==(covariant VideoModel other) {
    if (identical(this, other)) return true;

    return other.videoId == videoId &&
        other.caption == caption &&
        other.uid == uid &&
        other.videoUrl == videoUrl &&
        other.thumbnail == thumbnail &&
        other.postedAt == postedAt;
  }

  @override
  int get hashCode {
    return videoId.hashCode ^
        caption.hashCode ^
        uid.hashCode ^
        videoUrl.hashCode ^
        thumbnail.hashCode ^
        postedAt.hashCode;
  }
}
