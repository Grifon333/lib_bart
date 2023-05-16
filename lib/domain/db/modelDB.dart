import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:lib_bart/domain/db/const_db.dart';
import 'package:lib_bart/domain/entity/book.dart';
import 'package:lib_bart/domain/entity/genre.dart';
import 'package:lib_bart/settings/settings.dart';

class ModelDB {
  final db = FirebaseFirestore.instance;
  final dbAuth = FirebaseAuth.instance;

  Future<void> singWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await dbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> getUser(String email, String password) async {
    //TODO: change Table title 'users' -> 'user'
    //TODO: maybe use convertor from Map to Object as in method addUser()
    // final docs = (await db.collection('users').snapshots().first).docs;
    // final data = docs.where((doc) =>
    // doc.data()[ConstDB.EMAIL] == email &&
    //     doc.data()[ConstDB.PASSWORD] == password);
    // String userId = data.isNotEmpty ? data.first.id : '';
    final users = await db
        .collection('users')
        .where(ConstDB.EMAIL, isEqualTo: email)
        .where(ConstDB.PASSWORD, isEqualTo: password)
        .get();
    String? userId = users.size != 0 ? users.docs.first.id : null;
    //TODO: id
    if (userId == null) throw Exception('User not found.');
    AppSettings.id = userId;
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addUser({
    required String nickname,
    required String email,
    required String password,
  }) async {
    String userId = AppSettings.id;
    //TODO: method for check id
    bool checkUserData =
        (await db.collection('users').snapshots().first).docs.contains(userId);
    if (!checkUserData) {
      AppSettings.id = '0';
      userId = '0';
    }
    if (userId == '0') {
      final user = <String, dynamic>{
        ConstDB.FULL_NAME: null,
        ConstDB.NUMBER: null,
        ConstDB.NICKNAME: nickname,
        ConstDB.EMAIL: email,
        ConstDB.PASSWORD: password,
      };
      await db.collection('users').add(user).then((documentSnapshot) {
        userId = documentSnapshot.id;
        print("Added Data with ID: $userId");
        AppSettings.id = userId;
      });
    }
  }

  void updateUser({
    String? nickname,
    String? email,
    String? password,
    String? number,
    String? fullName,
  }) {
    final ref = db.collection('users').doc(AppSettings.id);
    print(AppSettings.id);
    final updateData = <String, dynamic>{
      if (nickname != null) ConstDB.NICKNAME: nickname,
      if (email != null) ConstDB.EMAIL: email,
      if (password != null) ConstDB.PASSWORD: password,
      if (number != null) ConstDB.NUMBER: number,
      if (fullName != null) ConstDB.FULL_NAME: fullName,
    };
    ref.update(updateData).then(
          (value) => print("DocumentSnapshot successfully updated!"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  Future<void> addBook(Book book) async {
    db
        .collection(ConstDB.TABLE_BOOK)
        .withConverter(
          fromFirestore: Book.fromFirestore,
          toFirestore: (Book book, _) => book.toFirestore(),
        )
        .add(book)
        .then((documentSnapshot) {
      print("Added Data with ID: ${documentSnapshot.id}");
    }, onError: (e) => print("Error writing document: $e"));
  }

  Future<List<Book>> getAllBooks() async {
    List<Book> booksList = [];
    await db
        .collection(ConstDB.TABLE_BOOK)
        .withConverter(
          fromFirestore: Book.fromFirestore,
          toFirestore: (Book book, _) => book.toFirestore(),
        )
        .get()
        .then(
      (querySnapdhot) {
        print('Successfully completed');
        for (var docSnapshot in querySnapdhot.docs) {
          booksList.add(docSnapshot.data());
        }
      },
      onError: (e) => print("Error completing (get Books): $e"),
    );
    return booksList;
  }

  Future<List<Genre>> getGenres(List<String> genresId) async {
    List<Genre> genresList = [];
    final ref = db.collection(ConstDB.TABLE_GENRE).withConverter(
          fromFirestore: Genre.fromFirestore,
          toFirestore: (Genre genre, _) => genre.toFirestore(),
        );
    for (var genreId in genresId) {
      final genre = (await ref.doc(genreId).get()).data();
      if (genre != null) {
        genresList.add(genre);
      }
    }

    // await db
    //     .collection(ConstDB.TABLE_GENRE)
    //     .withConverter(
    //       fromFirestore: Genre.fromFirestore,
    //       toFirestore: (Genre genre, _) => genre.toFirestore(),
    //     )
    //     .get()
    //     .then(
    //   (querySnapdhot) {
    //     print('Successfully completed');
    //     for (var docSnapshot in querySnapdhot.docs) {
    //       genresList.add(docSnapshot.data());
    //     }
    //   },
    //   onError: (e) => print("Error completing (get Genres): $e"),
    // );
    return genresList;
  }
}
