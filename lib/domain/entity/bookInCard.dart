import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class BookInCard {
  final String idBook;
  final String idOrder;
  final int count;

  BookInCard({
    required this.idBook,
    required this.idOrder,
    required this.count,
  });

  factory BookInCard.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return BookInCard(
      idBook: data[ConstDB.ID_BOOK],
      idOrder: data[ConstDB.ID_ORDER],
      count: data[ConstDB.COUNT],
    );
  }

  Map<String, dynamic> toFirestore() {
    return{
      ConstDB.ID_BOOK: idBook,
      ConstDB.ID_ORDER: idOrder,
      ConstDB.COUNT: count,
    };
  }
}
