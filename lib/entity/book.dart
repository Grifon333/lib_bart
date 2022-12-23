import 'package:lib_bart/entity/genre.dart';

class Book {
  final int id;
  final String title;
  final String authors;
  final int yearPublication;
  final String publisher;
  final int countPage;
  final int count;
  final List<int> genres;
  final String typeOfBinding;
  final String language;
  final String description;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.yearPublication,
    required this.publisher,
    required this.countPage,
    required this.count,
    required this.genres,
    required this.typeOfBinding,
    required this.language,
    required this.description,
  });
}
