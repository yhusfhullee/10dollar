import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class WithdrawModel {
  final String bankName;
  final String acountNumber;
  final String accountName;
  final String username;
  final String photoUrl;
  final String uid;
  final String id;
  final int amount;
  final bool isPaid;
  WithdrawModel({
    required this.bankName,
    required this.acountNumber,
    required this.accountName,
    required this.username,
    required this.photoUrl,
    required this.uid,
    required this.id,
    required this.amount,
    required this.isPaid,
  });

  WithdrawModel copyWith({
    String? bankName,
    String? acountNumber,
    String? accountName,
    String? username,
    String? photoUrl,
    String? uid,
    String? id,
    int? amount,
    bool? isPaid,
  }) {
    return WithdrawModel(
      bankName: bankName ?? this.bankName,
      acountNumber: acountNumber ?? this.acountNumber,
      accountName: accountName ?? this.accountName,
      username: username ?? this.username,
      photoUrl: photoUrl ?? this.photoUrl,
      uid: uid ?? this.uid,
      id: id ?? this.id,
      amount: amount ?? this.amount,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankName': bankName,
      'acountNumber': acountNumber,
      'accountName': accountName,
      'username': username,
      'photoUrl': photoUrl,
      'uid': uid,
      'amount': amount,
      'isPaid': isPaid,
    };
  }

  factory WithdrawModel.fromMap(Map<String, dynamic> map) {
    return WithdrawModel(
      bankName: map['bankName'] as String,
      acountNumber: map['acountNumber'] as String,
      accountName: map['accountName'] as String,
      username: map['username'] as String,
      photoUrl: map['photoUrl'] as String,
      uid: map['uid'] as String,
      id: map['\$id'] as String,
      amount: map['amount'] as int,
      isPaid: map['isPaid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory WithdrawModel.fromJson(String source) =>
      WithdrawModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WithdrawModel(bankName: $bankName, acountNumber: $acountNumber, accountName: $accountName, username: $username, photoUrl: $photoUrl, uid: $uid, id: $id, amount: $amount, isPaid: $isPaid)';
  }

  @override
  bool operator ==(covariant WithdrawModel other) {
    if (identical(this, other)) return true;

    return other.bankName == bankName &&
        other.acountNumber == acountNumber &&
        other.accountName == accountName &&
        other.username == username &&
        other.photoUrl == photoUrl &&
        other.uid == uid &&
        other.id == id &&
        other.amount == amount &&
        other.isPaid == isPaid;
  }

  @override
  int get hashCode {
    return bankName.hashCode ^
        acountNumber.hashCode ^
        accountName.hashCode ^
        username.hashCode ^
        photoUrl.hashCode ^
        uid.hashCode ^
        id.hashCode ^
        amount.hashCode ^
        isPaid.hashCode;
  }
}
