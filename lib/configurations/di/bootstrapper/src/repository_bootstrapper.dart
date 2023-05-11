import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/authorization.dart';
import 'package:get_it/get_it.dart';

/// Register singleton for repositories
Future<void> initRepositories(GetIt getIt) async {
  getIt
    ..registerSingleton(
      IAuthenticationRepository()
    )
    ..registerSingleton(
      IAuthorizationRepository()
    );
}
