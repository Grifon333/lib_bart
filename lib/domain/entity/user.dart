import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class User {
  final String? fullName;
  final String? number;
  final String? nickname;
  final String password;
  final String email;

  const User({
    this.fullName,
    this.number,
    this.nickname,
    required this.password,
    required this.email,
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return User(
      fullName: data[ConstDB.FULL_NAME],
      number: data[ConstDB.NUMBER],
      nickname: data[ConstDB.NICKNAME],
      password: data[ConstDB.PASSWORD],
      email: data[ConstDB.EMAIL],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.FULL_NAME: fullName,
      ConstDB.NUMBER: number,
      ConstDB.NICKNAME: nickname,
      ConstDB.PASSWORD: password,
      ConstDB.EMAIL: email,
    };
  }
}
