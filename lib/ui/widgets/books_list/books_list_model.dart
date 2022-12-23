import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lib_bart/entity/book.dart';

class BooksListModel extends ChangeNotifier {
  List<Book> books = [];
  final db = FirebaseFirestore.instance;

  void read() async {
    print('Read:');
    await db.collection('books').get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
        Map<String, dynamic> map = doc.data();

        books.add(Book(
          id: map['id'],
          title: map['title'],
          authors: map['authors'],
          yearPublication: map['yearPublication'],
          publisher: map['publisher'],
          countPage: map['countPage'],
          count: map['count'],
          genres:
              (map['genres'] as List<dynamic>).map((e) => e as int).toList(),
          typeOfBinding: map['typeOfBinding'],
          language: map['language'],
          description: map['description'],
        ));
      }
    });
  }
}
