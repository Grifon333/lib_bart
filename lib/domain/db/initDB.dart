import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InitDB {
  final _db = FirebaseFirestore.instance;
  final _dbAuth = FirebaseAuth.instance;

  get db => _db;
  get dbAuth => _dbAuth;
}