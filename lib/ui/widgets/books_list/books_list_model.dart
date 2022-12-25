import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lib_bart/entity/book.dart';
import 'package:lib_bart/entity/const_db.dart';

class BooksListModel extends ChangeNotifier {
  List<Book> books = <Book>[];
  final db = FirebaseFirestore.instance;

  var _isLoadingInProgress = false;
  int _currentPage = 0;

  Future<List<Book>> read() async {
    List<Book> list = [];
    print('Read:');

    await db.collection(ConstDB.TABLE_BOOKS).get().then(
      (event) async {
        for (var doc in event.docs) {
          print("${doc.id} => ${doc.data()}");
          Map<String, dynamic> data = doc.data();

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

          // books.add(Book(
          //   id: int.parse(doc.id),
          //   title: doc.data()['title'],
          //   authors: doc.data()['authors'],
          //   yearPublication: doc.data()['yearPublication'],
          //   publisher: doc.data()['publisher'],
          //   countPage: doc.data()['countPage'],
          //   genres: (doc.data()['genres'] as List<dynamic>).map((e) => e as int).toList(),
          //   typeOfBinding: doc.data()['typeOfBinding'],
          //   language: doc.data()['language'],
          //   description: doc.data()['description'],
          //   idVendor: doc.data()['idVendor'],
          //   price: doc.data()['price'],
          //   count: doc.data()['count'],
          //   reviews: (doc.data()['reviews'] as List<dynamic>).map((e) => e as int).toList(),
          // ));
        }
      },
    );
    return list;
  }

  List<Book> getBooks() {
    return books;
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage > 1) return;
    _isLoadingInProgress = true;

    final booksList = await read();
    books.clear();
    books.addAll(booksList);
    _isLoadingInProgress = false;
    _currentPage++;
    print('Length: ${books.length}');
    notifyListeners();
  }

  void showBookAtIndex(int index) {
    if (index < books.length - 1) return;
    _loadNextPage();
  }
}
