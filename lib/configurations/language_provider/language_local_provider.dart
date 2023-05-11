import 'package:dsplatform/configurations/l10n/l10n.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LanguageLocalProvider extends ChangeNotifier {

  Locale _locale = L10n.all.first;
  final secureStorage = const FlutterSecureStorage();
  Locale get locale => _locale;

  void setLocale(Locale locale) async {
    if(!L10n.all.contains(locale)) return;
    _locale = locale;
    secureStorage.write(key: AppSecureStorageKeys.languageKey, value: locale.languageCode);
    notifyListeners();
  }

  void clearLocale() {
    _locale = L10n.all.first;
    notifyListeners();
  }

}