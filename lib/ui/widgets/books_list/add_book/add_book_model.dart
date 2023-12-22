import 'package:flutter/material.dart';
import 'package:lib_bart/domain/db/const_db.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/domain/entity/book.dart';
import 'package:lib_bart/domain/entity/genre.dart';

class AddBookModel extends ChangeNotifier {
  List<List> parameters = [
    ['title', 'title', 1],
    ['authors', 'authors', 1],
    ['yearPublication', 'year publication', 1],
    ['publisher', 'publisher', 1],
    ['countPage', 'count page', 1],
    ['listGenresId', 'genres', 1],
    ['typeOfBinding', 'type of binding', 1],
    ['language', 'language', 1],
    ['description', 'description', 3],
    ['idVendor', 'id vendor', 1],
    ['price', 'price', 1],
    ['count', 'count', 1],
  ];
  Map<String, dynamic> bookData = {
    ConstDB.TITLE: null,
    ConstDB.AUTHORS: null,
    ConstDB.YEAR_PUBLICATION: null,
    ConstDB.PUBLISHER: null,
    ConstDB.COUNT_PAGE: null,
    ConstDB.LIST_GENTES_ID: null,
    ConstDB.TYPE_OF_BINDING: null,
    ConstDB.LANGUAGE: null,
    ConstDB.DESCRIPTION: null,
    ConstDB.ID_VENDOR: null,
    ConstDB.PRICE: null,
    ConstDB.COUNT: null,
  };
  Set<String> errorFields = {};

  void addField(String title, dynamic data) {
    if ((data as String) == '') {
      errorFields.add(title);
      bookData[title] = null;
      notifyListeners();
      return;
    } else {
      errorFields.remove(title);
    }
    if (title == ConstDB.YEAR_PUBLICATION ||
        title == ConstDB.COUNT_PAGE ||
        title == ConstDB.PRICE ||
        title == ConstDB.COUNT) {
      data = int.tryParse(data);
      if (data == null) {
        errorFields.add(title);
      } else {
        errorFields.remove(title);
      }
    }
    bookData[title] = data;
    notifyListeners();
  }

  Future<bool> addBook() async {
    if (!_isAllFieldsFilled()) {
      print('Error fields: $errorFields');
      return false;
    }
    List<String> genresList = (bookData[ConstDB.LIST_GENTES_ID] as String).split(', ');
    List<String> genresListId = [];
    for (String genre in genresList) {
      String? id = await ModelDB().getIdGenre(genre);
      id ??= await ModelDB().addGenre(Genre(title: genre));
      genresListId.add(id);
    }

    Book book = Book(
      title: bookData[ConstDB.TITLE],
      authors: bookData[ConstDB.AUTHORS],
      yearPublication: bookData[ConstDB.YEAR_PUBLICATION],
      publisher: bookData[ConstDB.PUBLISHER],
      countPage: bookData[ConstDB.COUNT_PAGE],
      listGenresId: genresListId,
      typeOfBinding: bookData[ConstDB.TYPE_OF_BINDING],
      language: bookData[ConstDB.LANGUAGE],
      description: bookData[ConstDB.DESCRIPTION],
      idVendor: bookData[ConstDB.ID_VENDOR],
      price: bookData[ConstDB.PRICE],
      count: bookData[ConstDB.COUNT],
    );
    await ModelDB().addBook(book);
    print('Book added');
    return true;
  }

  bool _isAllFieldsFilled() {
    errorFields.clear();
    for (String key in bookData.keys) {
      if (bookData[key] == null) {
        errorFields.add(key);
      }
    }
    notifyListeners();
    return errorFields.isEmpty;
  }
}
