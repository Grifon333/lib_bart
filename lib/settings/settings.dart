abstract class AppSettings {
  AppSettings._();

  //TODO: null
  static String _id = '0';

  static String get id => _id;

  static set id(String value) {
    _id = value;
  }
}