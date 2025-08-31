class Routes {
  // Singleton instance
  static final Routes _instance = Routes._internal();

  // Private constructor
  Routes._internal();

  // Factory constructor to return the same instance
  factory Routes() {
    return _instance;
  }

  // Static route constants
  static const String home = '/';

  static const String homeSearch = '/home_search';

  static const String drugDetails = '/drug_details';
}
