import 'package:dsplatform/configurations/language_provider/language_local_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> initLanguage(GetIt getIt) async {
  getIt.registerSingleton(LanguageLocalProvider());
}