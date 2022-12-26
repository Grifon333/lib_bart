import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/entity/const_db.dart';

class BookInCard {
  final String id;
  final String idBook;
  final int count;

  BookInCard({
    required this.id,
    required this.idBook,
    required this.count,
  });

  factory BookInCard.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return BookInCard(
      id: snapshot.id,
      idBook: data[ConstDB.ID_BOOK],
      count: data[ConstDB.COUNT],
    );
  }

  Map<String, dynamic> toFirestore() {
    return{
      ConstDB.ID: id,
      ConstDB.ID_BOOK: idBook,
      ConstDB.COUNT: count,
    };
  }
}
