import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_bart/domain/db/const_db.dart';

class Book {
  final String title;
  final String authors;
  final int yearPublication;
  final String publisher;
  final int countPage;
  final List<String> listGenresId;
  final String typeOfBinding;
  final String language;
  final String description;
  final String idVendor;
  final int price;
  final int count;

  const Book({
    required this.title,
    required this.authors,
    required this.yearPublication,
    required this.publisher,
    required this.countPage,
    required this.listGenresId,
    required this.typeOfBinding,
    required this.language,
    required this.description,
    required this.idVendor,
    required this.price,
    required this.count,
  });

  factory Book.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Book(
      title: data[ConstDB.TITLE],
      authors: data[ConstDB.AUTHORS],
      yearPublication: data[ConstDB.YEAR_PUBLICATION],
      publisher: data[ConstDB.PUBLISHER],
      countPage: data[ConstDB.COUNT_PAGE],
      listGenresId: data[ConstDB.LIST_GENTES_ID] is Iterable
          ? List.from(data[ConstDB.LIST_GENTES_ID])
          : List.empty(),
      typeOfBinding: data[ConstDB.TYPE_OF_BINDING],
      language: data[ConstDB.LANGUAGE],
      description: data[ConstDB.DESCRIPTION],
      idVendor: data[ConstDB.ID_VENDOR],
      price: data[ConstDB.PRICE],
      count: data[ConstDB.COUNT],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      ConstDB.TITLE: title,
      ConstDB.AUTHORS: authors,
      ConstDB.YEAR_PUBLICATION: yearPublication,
      ConstDB.PUBLISHER: publisher,
      ConstDB.COUNT_PAGE: countPage,
      ConstDB.LIST_GENTES_ID: listGenresId,
      ConstDB.TYPE_OF_BINDING: typeOfBinding,
      ConstDB.LANGUAGE: language,
      ConstDB.DESCRIPTION: description,
      ConstDB.ID_VENDOR: idVendor,
      ConstDB.PRICE: price,
      ConstDB.COUNT: count,
    };
  }

  @override
  String toString() {
    return 'Book {\n'
        'title: $title,\n'
        'authors: $authors,\n'
        'yearPublication: $yearPublication,\n'
        'publisher: $publisher,\n'
        'countPage: $countPage,\n'
        'listGenresId: $listGenresId,\n'
        'typeOfBinding: $typeOfBinding,\n'
        'language: $language,\n'
        'description: $description,\n'
        'idVendor: $idVendor,\n'
        'price: $price,\n'
        'count: $count\n'
        '}';
  }
}
