import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class Review {
  final String content;
  final String idBook;
  final String idUser;

  Review({
    required this.content,
    required this.idBook,
    required this.idUser,
  });

  factory Review.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Review(
      content: data[ConstDB.CONTENT],
      idBook: data[ConstDB.ID_BOOK],
      idUser: data[ConstDB.ID_USER],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.CONTENT: content,
      ConstDB.ID_BOOK: idBook,
      ConstDB.ID_USER: idUser,
    };
  }
}
