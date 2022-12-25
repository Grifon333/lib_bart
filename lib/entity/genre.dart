import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/entity/const_db.dart';

class Genre {
  final int id;
  final String title;

  const Genre({
    required this.id,
    required this.title,
  });

  factory Genre.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Genre(
      id: data[ConstDB.ID],
      title: data[ConstDB.TITLE],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.ID: id,
      ConstDB.TITLE: title,
    };
  }
}
