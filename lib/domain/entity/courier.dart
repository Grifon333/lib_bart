import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class Courier {
  final String fullName;
  final String number;
  final String status;

  const Courier({
    required this.fullName,
    required this.number,
    required this.status,
  });

  factory Courier.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Courier(
      fullName: data[ConstDB.FULL_NAME],
      number: data[ConstDB.NUMBER],
      status: data[ConstDB.STATUS],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.FULL_NAME: fullName,
      ConstDB.NUMBER: number,
      ConstDB.STATUS: status,
    };
  }
}
