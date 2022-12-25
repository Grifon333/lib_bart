import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/entity/const_db.dart';

class Book {
  final String id;
  final String title;
  final String authors;
  final int yearPublication;
  final String publisher;
  final int countPage;
  final List<String> genres;
  final String typeOfBinding;
  final String language;
  final String description;
  final int idVendor;
  final int price;
  final int count;
  final List<String> reviews;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.yearPublication,
    required this.publisher,
    required this.countPage,
    required this.genres,
    required this.typeOfBinding,
    required this.language,
    required this.description,
    required this.idVendor,
    required this.price,
    required this.count,
    required this.reviews,
  });

  factory Book.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Book(
      id: data[ConstDB.ID] ?? '-1',
      title: data[ConstDB.TITLE],
      authors: data[ConstDB.AUTHORS],
      yearPublication: data[ConstDB.YEAR_PUBLICATION],
      publisher: data[ConstDB.PUBLISHER],
      countPage: data[ConstDB.COUNT_PAGE],
      genres: data[ConstDB.GENRES] is Iterable
          ? List.from(data[ConstDB.GENRES])
          : List.empty(),
      typeOfBinding: data[ConstDB.TYPE_OF_BINDING],
      language: data[ConstDB.LANGUAGE],
      description: data[ConstDB.DESCRIPTION],
      idVendor: data[ConstDB.ID_VENDOR],
      price: data[ConstDB.PRICE],
      count: data[ConstDB.COUNT],
      reviews: data[ConstDB.REVIEW] is Iterable
          ? List.from(data[ConstDB.REVIEW])
          : List.empty(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.ID: id,
      ConstDB.TITLE: title,
      ConstDB.AUTHORS: authors,
      ConstDB.YEAR_PUBLICATION: yearPublication,
      ConstDB.PUBLISHER: publisher,
      ConstDB.COUNT_PAGE: countPage,
      ConstDB.GENRES: genres,
      ConstDB.TYPE_OF_BINDING: typeOfBinding,
      ConstDB.LANGUAGE: language,
      ConstDB.DESCRIPTION: description,
      ConstDB.ID_VENDOR: idVendor,
      ConstDB.PRICE: price,
      ConstDB.COUNT: count,
      ConstDB.REVIEW: reviews,
    };
  }
}
