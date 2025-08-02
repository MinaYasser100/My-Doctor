class AppConst {
  // Singleton instance
  static final AppConst _instance = AppConst._internal();

  // Private constructor
  AppConst._internal();

  // Factory constructor to return the same instance
  factory AppConst() => _instance;

  // Static constants
  static const String baseUrl =
      'https://dailymed.nlm.nih.gov/dailymed/services/v2/';
  static const String spls = 'spls';
  static const String spl = 'spl'; // Will be used with setid
  static const String search = 'search.json';
  static const String label = 'label.json';
}
