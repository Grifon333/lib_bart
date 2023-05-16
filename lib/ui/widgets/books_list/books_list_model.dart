import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/domain/entity/book.dart';
import 'package:lib_bart/domain/entity/genre.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class BooksListModel extends ChangeNotifier {
  List<Book> books = [];
  List<List<Genre>> genres = [];

  Future<void> fun() async {
    // Book book = const Book(
    //   title: 'title2',
    //   authors: 'authors2',
    //   yearPublication: 2022,
    //   publisher: 'publisher2',
    //   countPage: 350,
    //   listGenresId: [
    //     'Ju17KxZU145nFegOMC6q',
    //     'Ozpe3C0U6Euu4WhqBPGw',
    //   ],
    //   typeOfBinding: 'Soft',
    //   language: 'UA',
    //   description: 'History of ...',
    //   idVendor: '2',
    //   price: 12,
    //   count: 1,
    // );
    // await ModelDB().addBook(book);

    books = await ModelDB().getAllBooks();
    genres = [];
    for(var book in books) {
      List<Genre> genresList = await ModelDB().getGenres(book.listGenresId);
      genres.add(genresList);
    }
    print(genres.length);
    for(var genresRow in genres) {
      print(genresRow.length);
      for(var genre in genresRow) {
        print(genre.title);
      }
    }
  }

  void toCard(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationNameRoute.card);
  }

  Future<void> addBookInCard(String id) async {
    // final bookInCard = <String, dynamic>{
    //   ConstDB.ID_BOOK: id,
    //   ConstDB.COUNT: 1,
    // };
    // await db.collection(ConstDB.TABLE_BOOK_IN_ORDER).add(bookInCard);
    //
    // final ref = await db
    //     .collection(ConstDB.TABLE_ORDER)
    //     .where(ConstDB.ID_USER, isEqualTo: AppSettings.id)
    //     .get();
    // if (ref.size == 0) {
    //   final item = <String, dynamic>{
    //     ConstDB.ID_USER: AppSettings.id,
    //     // ConstDB.ID_BOOKS_IN_ORDER: [id],
    //     ConstDB.ADDRESS: null,
    //     ConstDB.DATE_REGISTRATION: null,
    //     ConstDB.STATUS: 'In process'
    //   };
    //   await db.collection(ConstDB.TABLE_ORDER).add(item);
    // } else {
    //   final ord = await db
    //       .collection(ConstDB.TABLE_ORDER)
    //       .where('idUser', isEqualTo: AppSettings.id)
    //       .get();
    //   final map = (await db
    //           .collection(ConstDB.TABLE_ORDER)
    //           .doc(ord.docs.first.id)
    //           .get())
    //       .data();
    //   List<String> list = (map?['idBooksInOrder'] as List<dynamic>)
    //       .map((e) => e.toString())
    //       .toList();
    //   list.add(id);
    //   list = list.toSet().toList();
    //   db.collection(ConstDB.TABLE_ORDER).doc(ord.docs.first.id).update({
    //     'idBooksInOrder': list,
    //   });
    // }
  }
}
