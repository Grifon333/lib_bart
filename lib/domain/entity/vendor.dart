import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class Vendor {
  final String fullName;
  final String number;
  final String email;

  const Vendor({
    required this.fullName,
    required this.number,
    required this.email,
  });

  factory Vendor.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Vendor(
      fullName: data[ConstDB.FULL_NAME],
      number: data[ConstDB.NUMBER],
      email: data[ConstDB.EMAIL],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.FULL_NAME: fullName,
      ConstDB.NUMBER: number,
      ConstDB.EMAIL: email,
    };
  }
}
