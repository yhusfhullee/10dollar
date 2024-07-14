import 'dart:convert';

//ignore_for_file: public_member_api_docs, sort_constructors_first


class Voter {
  final String username;
  final String uid;

  Voter({
    required this.username,
    required this.uid,
  });

  Voter copyWith({
    String? username,
    String? uid,
  }) {
    return Voter(
      username: username ?? this.username,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
    };
  }

  factory Voter.fromMap(Map<String, dynamic> map) {
    return Voter(
      username: map['username'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Voter(username: $username, uid: $uid)';

  @override
  bool operator ==(covariant Voter other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.uid == uid;
  }

  @override
  int get hashCode => username.hashCode ^ uid.hashCode;
}
