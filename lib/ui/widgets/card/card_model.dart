import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/entity/order.dart';
import 'package:lib_bart/settings/settings.dart';

class CardModel extends ChangeNotifier {
  late Order order;
  final db = FirebaseFirestore.instance;

  void toPrevWindow(BuildContext context) {
    Navigator.pop(context);
  }

  void loadOrder() async {
    final ref = db.collection('order').doc(AppSettings.id).withConverter(
      fromFirestore: Order.fromFirestore,
      toFirestore: (Order order, _) => order.toFirestore(),
    );
    final docSnap = await ref.get();
    final item = docSnap.data();
    if (item != null) {
      print(item);
    } else {
      print("No such document.");
    }
  }
}