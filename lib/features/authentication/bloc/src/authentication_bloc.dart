import 'dart:async';
import 'dart:developer';

import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> with ChangeNotifier {

  final AuthenticationRepository authenticationRepository;
  late final StreamSubscription<AuthenticationState> _blocStream;


  AuthenticationBloc({required this.authenticationRepository}) : super(AuthenticationUninitializedState()) {

    /// Bloc stream state notifier
    _blocStream = stream.listen((state) {
      notifyListeners();
    });


    /// App started event
    on<AppStarted>((event, emit) async {
      try {
        final bool hasToken = await authenticationRepository.hasToken();
        log(hasToken.toString(), name: "Has token");
        if (hasToken) {
          await GetIt.I.get<Authenticator>().createClient();
          String? pinCode = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.pinCodeKey);
          bool isUserFillProfile = await authenticationRepository.isUserFillProfile();
          log(isUserFillProfile.toString(), name: "isUserFillProfile");
          FlutterNativeSplash.remove();
          notifyListeners();
          return emit(AuthenticationAuthenticatedState(pinCodeSet: pinCode != null, isUserFillProfile: isUserFillProfile));
        } else {
          FlutterNativeSplash.remove();
          notifyListeners();
          return emit(AuthenticationUnauthenticatedState());
        }
      } on Exception catch (error, _) {
        return emit(AuthenticationUnauthenticatedState());
      }
    });


    /// LoggedIn event
    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoadingState());
      String? pinCode = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.pinCodeKey);
      bool isUserFillProfile = await authenticationRepository.isUserFillProfile();
      notifyListeners();
      return emit(AuthenticationAuthenticatedState(pinCodeSet: pinCode != null, isUserFillProfile: isUserFillProfile));
    });

    /// LoggedOut event
    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoadingState());
      await authenticationRepository.logout();
      await GetIt.I.get<Authenticator>().logout();
      await GetIt.I.get<Authenticator>().clearCookies();
      await const FlutterSecureStorage().deleteAll();
      notifyListeners();
      return emit(AuthenticationUnauthenticatedState());
    });

  }

  @override
  Future<void> close() {
    _blocStream.cancel();
    return super.close();
  }
}
