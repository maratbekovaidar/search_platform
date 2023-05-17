

import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/authorization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {

  final AuthorizationRepository authorizationRepository;

  AuthorizationBloc({required this.authorizationRepository}) : super(AuthorizationInitialState()) {

    on<AuthorizationLogoutButtonPressedEvent>((event, emit) {
      GetIt.I.get<AuthenticationBloc>().add(LoggedOut());
    });

    on<AuthorizationRegistrationButtonPressedEvent>((event, emit) async {
      emit(AuthorizationLoadingState());
      try {
        bool registrationResult = await authorizationRepository.registration(event.username, event.password);
        if (registrationResult) {
          // emit(AuthorizationSuccessState(token: token));
          // GetIt.I.get<AuthenticationBloc>().add(LoggedIn(token: token));
          return emit(AuthorizationRegistrationSuccessState());
        } else {
          return emit(AuthorizationFailureState(exception: AuthorizationFailureException("Registration failed")));
        }
      } on Exception catch (e, _) {
        // GetIt.I.get<FlavorConfiguration>().changeApiEndpoint();
        return emit(AuthorizationFailureState(exception: e));
      }
    });

    on<AuthorizationIsUserInvitedEvent>((event, emit) async {
      emit(AuthorizationLoadingState());
      try {
        return emit(AuthorizationUserInvitedState(result: await authorizationRepository.isUserInvited(event.email)));
      } on Exception catch(e, _) {
        return emit(AuthorizationFailureState(exception: e));
      }
    });

  }
}
