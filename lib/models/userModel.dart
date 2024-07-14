import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String username;
  final String email;
  final String password;
  final String uid;
  final String musicbio;
  final int userBalance;
  final List followers;
  final List following;
  final List stacks;
  final String photoUrl;
  final String accountNumber;
  final String accountName;
  final String? firebaseToken;
  final String bankName;
  final bool isVerified;
  final bool isAdmin;
  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.uid,
    required this.musicbio,
    required this.userBalance,
    required this.followers,
    required this.following,
    required this.stacks,
    required this.photoUrl,
    required this.accountNumber,
    required this.accountName,
    required this.firebaseToken,
    required this.bankName,
    required this.isVerified,
    required this.isAdmin,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? password,
    String? uid,
    String? musicbio,
    int? userBalance,
    List? followers,
    List? following,
    List? stacks,
    String? photoUrl,
    String? accountNumber,
    String? accountName,
    String? firebaseToken,
    String? bankName,
    bool? isVerified,
    bool? isAdmin,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      musicbio: musicbio ?? this.musicbio,
      userBalance: userBalance ?? this.userBalance,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      stacks: stacks ?? this.stacks,
      photoUrl: photoUrl ?? this.photoUrl,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      firebaseToken: firebaseToken ?? this.firebaseToken,
      bankName: bankName ?? this.bankName,
      isVerified: isVerified ?? this.isVerified,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'musicbio': musicbio,
      'userBalance': userBalance,
      'followers': followers,
      'following': following,
      'stacks': stacks,
      'photoUrl': photoUrl,
      'accountNumber': accountNumber,
      'accountName': accountName,
      'firebaseToken': firebaseToken,
      'bankName': bankName,
      'isVerified': isVerified,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      uid: map['\$id'] as String,
      musicbio: map['musicbio'] as String,
      userBalance: map['userBalance'] as int,
      followers: List.from((map['followers'] as List)),
      following: List.from((map['following'] as List)),
      stacks: List.from((map['stacks'] as List)),
      photoUrl: map['photoUrl'] as String,
      accountNumber: map['accountNumber'] as String,
      accountName: map['accountName'] as String,
      firebaseToken: map['firebaseToken'] as String?,
      bankName: map['bankName'] as String,
      isVerified: map['isVerified'] as bool,
      isAdmin: map['isAdmin'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, password: $password, uid: $uid, musicbio: $musicbio, userBalance: $userBalance, followers: $followers, following: $following, stacks: $stacks, photoUrl: $photoUrl, accountNumber: $accountNumber, accountName: $accountName, firebaseToken: $firebaseToken, bankName: $bankName, isVerified: $isVerified, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password &&
        other.uid == uid &&
        other.musicbio == musicbio &&
        other.userBalance == userBalance &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        listEquals(other.stacks, stacks) &&
        other.photoUrl == photoUrl &&
        other.accountNumber == accountNumber &&
        other.accountName == accountName &&
        other.firebaseToken == firebaseToken &&
        other.bankName == bankName &&
        other.isVerified == isVerified &&
        other.isAdmin == isAdmin;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        uid.hashCode ^
        musicbio.hashCode ^
        userBalance.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        stacks.hashCode ^
        photoUrl.hashCode ^
        accountNumber.hashCode ^
        accountName.hashCode ^
        firebaseToken.hashCode ^
        bankName.hashCode ^
        isVerified.hashCode ^
        isAdmin.hashCode;
  }
}
