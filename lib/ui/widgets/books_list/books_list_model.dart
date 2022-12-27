import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lib_bart/entity/book.dart';
import 'package:lib_bart/entity/const_db.dart';
import 'package:lib_bart/entity/genre.dart';
import 'package:lib_bart/settings/settings.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class BooksListModel extends ChangeNotifier {
  List<Book> books = [];
  List<List<String>> allGenres = [];
  final db = FirebaseFirestore.instance;

  var _isLoadingInProgress = false;
  int _currentPage = 0;

  Future<List<Book>> _read() async {
    List<Book> list = [];
    print('Read:');

    await db.collection(ConstDB.TABLE_BOOKS).get().then(
      (event) async {
        for (var doc in event.docs) {
          print("${doc.id} => ${doc.data()}");

          final ref = doc.reference.withConverter(
            fromFirestore: Book.fromFirestore,
            toFirestore: (Book book, _) => book.toFirestore(),
          );

          final docSnap = await ref.get();
          final book = docSnap.data();
          if (book != null) {
            list.add(book);
            print('Get book: $book');
          } else {
            print('No such document');
          }
        }
      },
    );
    return list;
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage > 1) return;
    _isLoadingInProgress = true;

    final booksList = await _read();
    List<List<String>> genresList = [];
    for (int i = 0; i < booksList.length; i++) {
      final t = await _loadGenres(booksList[i].genres);
      genresList.add(t);
    }

    books.clear();
    allGenres.clear();
    books.addAll(booksList);
    allGenres.addAll(genresList);
    _isLoadingInProgress = false;
    _currentPage++;
    print('Length: ${books.length}');
    notifyListeners();
  }

  void showBookAtIndex(int index) {
    if (index < books.length - 1) return;
    _loadNextPage();
  }

  Future<List<String>> _loadGenres(List<String> listId) async {
    List<String> genres = [];
    for (int i = 0; i < listId.length; i++) {
      final ref = db.collection("genre").doc(listId[i]).withConverter(
            fromFirestore: Genre.fromFirestore,
            toFirestore: (Genre genre, _) => genre.toFirestore(),
          );

      final docSnap = await ref.get();
      final genre = docSnap.data(); // Convert to City object
      if (genre != null) {
        genres.add(genre.title);
        print(genre);
      } else {
        print("No such document. Genre");
        genres.add('');
      }
    }

    return genres;
  }

  void toCard(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationNameRoute.card);
  }

  Future<void> addBookInCard(String id) async {
    final bookInCard = <String, dynamic>{
      ConstDB.ID_BOOK: id,
      ConstDB.COUNT: 1,
    };
    await db.collection(ConstDB.TABLE_BOOK_IN_ORDER).add(bookInCard);

    final ref = await db
        .collection(ConstDB.TABLE_ORDER)
        .where(ConstDB.ID_USER, isEqualTo: AppSettings.id)
        .get();
    if (ref.size == 0) {
      final item = <String, dynamic>{
        ConstDB.ID_USER: AppSettings.id,
        ConstDB.ID_BOOKS_IN_ORDER: [id],
        ConstDB.ADDRESS: null,
        ConstDB.DATE_REGISTRATION: null,
        ConstDB.STATUS: 'In process'
      };
      await db.collection(ConstDB.TABLE_ORDER).add(item);
    } else {
      final ord = await db
          .collection(ConstDB.TABLE_ORDER)
          .where('idUser', isEqualTo: AppSettings.id)
          .get();
      final map = (await db
              .collection(ConstDB.TABLE_ORDER)
              .doc(ord.docs.first.id)
              .get())
          .data();
      List<String> list = (map?['idBooksInOrder'] as List<dynamic>)
          .map((e) => e.toString())
          .toList();
      list.add(id);
      list = list.toSet().toList();
      db.collection(ConstDB.TABLE_ORDER).doc(ord.docs.first.id).update({
        'idBooksInOrder': list,
      });
    }
  }
}
