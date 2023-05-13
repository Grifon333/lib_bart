abstract class ConstDB {
  /// tables
  static const TABLE_BOOK = 'book';
  static const TABLE_USER = 'user';
  static const TABLE_BOOK_IN_ORDER = 'bookInOrder';
  static const TABLE_COURIER = 'courier';
  static const TABLE_GENRE = 'genre';
  static const TABLE_ORDER = 'order';
  static const TABLE_REVIEW = 'review';
  static const TABLE_VENDOR = 'vendor';

  /// fields
  // Book
  static const TITLE = 'title';
  static const AUTHORS = 'authors';
  static const YEAR_PUBLICATION = 'yearPublication';
  static const PUBLISHER = 'publisher';
  static const COUNT_PAGE = 'countPage';
  static const LIST_GENTES_ID = 'listGenresId';
  static const TYPE_OF_BINDING = 'typeOfBinding';
  static const LANGUAGE = 'language';
  static const DESCRIPTION = 'description';
  static const ID_VENDOR = 'idVendor';
  static const PRICE = 'price';
  static const COUNT = 'count';

  // Book in order
  static const ID_BOOK = 'idBook';
  static const ID_ORDER = 'idOrder';
  // COUNT

  // Genre
  // TITLE

  // Order
  static const ID_USER = 'idUser';
  static const ADDRESS = 'address';
  static const DATE_REGISTRATION = 'dateRegistration';
  static const STATUS = 'status';
  static const ID_COURIER = 'idCourier';

  // Vendor
  static const FULL_NAME = 'fullName';
  static const NUMBER = 'number';
  static const EMAIL = 'email';

  // Courier
  // FULL_NAME
  // NUMBER
  // STATUS

  // User
  // FULL_NAME
  // NUMBER
  static const NICKNAME = 'nickname';
  static const PASSWORD = 'password';
  // EMAIL

  // Review
  static const CONTENT = 'content';
  // ID_BOOK
  // ID_USER
}
