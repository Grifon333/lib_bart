abstract class AppSettings {
  AppSettings._();

  //TODO: null
  static String _id = '0';
  static String _role = '';

  static String get id => _id;

  static String get role => _role;

  static set id(String value) {
    _id = value;
  }

  static set role(String value) {
    _role = value;
  }
}