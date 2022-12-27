import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/entity/const_db.dart';

class Order {
  final String id;
  final String idUser;
  final List<String> idBooksInOrder;
  final String? address;
  final String dateRegistration;
  final String status;

  Order({
    required this.id,
    required this.idUser,
    required this.idBooksInOrder,
    required this.address,
    required this.dateRegistration,
    required this.status,
  });

  factory Order.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Order(
      id: snapshot.id,
      idUser: data[ConstDB.ID_USER],
      idBooksInOrder: data[ConstDB.ID_BOOKS_IN_ORDER],
      address: data[ConstDB.ADDRESS],
      dateRegistration: data[ConstDB.DATE_REGISTRATION],
      status: data[ConstDB.STATUS],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.ID: id,
      ConstDB.ID_USER: idUser,
      ConstDB.ID_BOOKS_IN_ORDER: idBooksInOrder,
      ConstDB.ADDRESS: address,
      ConstDB.DATE_REGISTRATION: dateRegistration,
      ConstDB.STATUS: status,
    };
  }
}
