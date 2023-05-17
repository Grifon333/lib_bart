import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/domain/entity/book.dart';
import 'package:lib_bart/domain/entity/bookInCard.dart';

class CardModel extends ChangeNotifier {
  List<BookInCard> booksInOrder = [];
  List<Book> booksInfo = [];

  void toPrevWindow(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> loadOrderData() async {
    booksInOrder = await ModelDB().getBooksInOrder();
    for(var bookInOrder in booksInOrder) {
      final book = await ModelDB().getBookInfoInOrderById(bookInOrder.idBook);
      if (book != null) {
        booksInfo.add(book);
      }
    }
  }
}