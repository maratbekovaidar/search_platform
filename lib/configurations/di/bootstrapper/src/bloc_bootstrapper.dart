import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/authorization.dart';
import 'package:dsplatform/features/authorization/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

/// Register singleton for BLoCs
Future<void> initBloc(GetIt getIt) async {
  getIt
    ..registerSingleton(
      AuthenticationBloc(authenticationRepository: GetIt.I.get<IAuthenticationRepository>())
    )
    ..registerSingleton(
      AuthorizationBloc(authorizationRepository: GetIt.I.get<IAuthorizationRepository>())
    );
}