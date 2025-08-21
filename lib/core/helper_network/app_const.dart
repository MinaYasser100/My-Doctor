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
  // لجلب قائمة الأدوية (غالباً بيستخدم لعرض الأدوية الشعبية).
  static const String spls = 'spls';
  // لجلب تفاصيل دواء معين بناءً على setId
  static const String spl = 'spl';
  // للبحث عن أدوية بناءً على كلمة مفتاحية (query).
  static const String search = 'search.json';
  // (مش واضح استخدامه بدقة من الكود، لكنه ممكن يكون لجلب تفاصيل إضافية عن الدواء).
  static const String label = 'label.json';
  // What's new ?
  static const String newData = '/spls/recent';
}
