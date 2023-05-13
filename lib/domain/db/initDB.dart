import 'package:cloud_firestore/cloud_firestore.dart';

class InitDB {
  final _db = FirebaseFirestore.instance;

  get db => _db;
}