import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class Genre {
  final String title;

  const Genre({
    required this.title,
  });

  factory Genre.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Genre(
      title: data[ConstDB.TITLE],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.TITLE: title,
    };
  }
}
