import 'dart:convert';

import 'package:collection/collection.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class StackerModel {
  final String uid;
  final String stackId;
  final int amount;
  final bool isPaid;
  final bool isWon;
  final bool isEnd;
  final String amountWon;
  List optionChoose;

  StackerModel({
    required this.uid,
    required this.stackId,
    required this.amount,
    required this.isPaid,
    required this.isWon,
    required this.isEnd,
    required this.amountWon,
    required this.optionChoose,
  });

  StackerModel copyWith({
    String? uid,
    String? stackId,
    int? amount,
    bool? isPaid,
    bool? isWon,
    bool? isEnd,
    String? amountWon,
    List? optionChoose,
  }) {
    return StackerModel(
      uid: uid ?? this.uid,
      stackId: stackId ?? this.stackId,
      amount: amount ?? this.amount,
      isPaid: isPaid ?? this.isPaid,
      isWon: isWon ?? this.isWon,
      isEnd: isEnd ?? this.isEnd,
      amountWon: amountWon ?? this.amountWon,
      optionChoose: optionChoose ?? this.optionChoose,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'stackId': stackId,
      'amount': amount,
      'isPaid': isPaid,
      'isWon': isWon,
      'isEnd': isEnd,
      'amountWon': amountWon,
      'optionChoose': optionChoose,
    };
  }

  factory StackerModel.fromMap(Map<String, dynamic> map) {
    return StackerModel(
        uid: map['uid'] as String,
        stackId: map['stackId'] as String,
        amount: map['amount'] as int,
        isPaid: map['isPaid'] as bool,
        isWon: map['isWon'] as bool,
        isEnd: map['isEnd'] as bool,
        amountWon: map['amountWon'] as String,
        optionChoose: List.from(
          (map['optionChoose'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory StackerModel.fromJson(String source) =>
      StackerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StackerModel( uid: $uid, stackId: $stackId, amount: $amount, isPaid: $isPaid, isWon: $isWon, isEnd: $isEnd, amountWon: $amountWon, optionChoose: $optionChoose)';
  }

  @override
  bool operator ==(covariant StackerModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.uid == uid &&
        other.stackId == stackId &&
        other.amount == amount &&
        other.isPaid == isPaid &&
        other.isWon == isWon &&
        other.isEnd == isEnd &&
        other.amountWon == amountWon &&
        listEquals(other.optionChoose, optionChoose);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        stackId.hashCode ^
        amount.hashCode ^
        isPaid.hashCode ^
        isWon.hashCode ^
        isEnd.hashCode ^
        amountWon.hashCode ^
        optionChoose.hashCode;
  }
}
