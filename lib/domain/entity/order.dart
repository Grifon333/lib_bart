import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

//TODO: Status: Created, InProcess, Completed
class Order {
  final String idUser;
  final String? address;
  final String dateRegistration;
  final String status;
  final String? idCourier;

  Order({
    required this.idUser,
    required this.address,
    required this.dateRegistration,
    required this.status,
    required this.idCourier,
  });

  factory Order.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Order(
      idUser: data[ConstDB.ID_USER],
      address: data[ConstDB.ADDRESS],
      dateRegistration: data[ConstDB.DATE_REGISTRATION],
      status: data[ConstDB.STATUS],
      idCourier: data[ConstDB.ID_COURIER],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.ID_USER: idUser,
      ConstDB.ADDRESS: address,
      ConstDB.DATE_REGISTRATION: dateRegistration,
      ConstDB.STATUS: status,
      ConstDB.ID_COURIER: idCourier,
    };
  }
}
