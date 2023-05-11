import 'package:dsplatform/configurations/di/bootstrapper/src/bloc_bootstrapper.dart';
import 'package:dsplatform/configurations/di/bootstrapper/src/repository_bootstrapper.dart';
import 'package:dsplatform/configurations/language_provider/language_bootstrapper.dart';
import 'package:get_it/get_it.dart';

/// Setup Inversion of control
Future<void> setupIoc() async {

  /// Init GetIt
  final getIt = GetIt.I;

  /// TODO@Feature: caching
  /// await initCache(getIt);

  /// Call init repositories
  await initRepositories(getIt);
  /// Call init blocs
  await initBloc(getIt);
  /// Call  init languages
  await initLanguage(getIt);
}