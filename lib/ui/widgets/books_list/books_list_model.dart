import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/domain/entity/book.dart';
import 'package:lib_bart/domain/entity/genre.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class BooksListModel extends ChangeNotifier {
  List<Book> books = [];
  List<List<Genre>> genres = [];
  late List<bool> selectedBooks;
  String filterTitle = '';

  Future<void> getData() async {
    // Book book = const Book(
    //   title: '',
    //   authors: '',
    //   yearPublication: ,
    //   publisher: '',
    //   countPage: ,
    //   listGenresId: [
    //     '',
    //   ],
    //   typeOfBinding: '',
    //   language: '',
    //   description: '',
    //   idVendor: '',
    //   price: ,
    //   count: ,
    // );
    // await ModelDB().addBook(book);

    int oldCountBooks = books.length;
    books = (await ModelDB().getAllBooks())
        .where((element) =>
            element.title.toLowerCase().contains(filterTitle.toLowerCase()))
        .toList();
    genres = [];
    for (var book in books) {
      List<Genre> genresList = await ModelDB().getGenres(book.listGenresId);
      genres.add(genresList);
    }
    selectedBooks = List.filled(books.length, false);
    if (books.length != oldCountBooks) {
      notifyListeners();
    }
  }

  void toCard(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationNameRoute.card);
  }

  Future<void> addBookInCard(int index) async {
    await ModelDB().addBookToCard(books[index]);
    selectedBooks[index] = true;
    notifyListeners();
  }

  void setTitleFilter(String filter) {
    if (filter == filterTitle) return;
    filterTitle = filter;
    notifyListeners();
  }
}
