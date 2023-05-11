import 'dart:ui';

class L10n {
  static const all = [
    Locale('ru'),
    Locale('en'),
    Locale('kk'),
  ];

  static String getFlag(String code) {
    switch(code) {
      case 'en':
        return '🇬🇧';
      case 'kk':
        return '🇰🇿';
      case 'ru':
        return '🇷🇺';
      default:
        return '🇬🇧';
    }
  }
}