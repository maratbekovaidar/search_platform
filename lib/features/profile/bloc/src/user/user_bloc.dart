import 'dart:developer';

import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitialState()) {

    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        UserModel? userModel = await userRepository.getUserInfo();
        if(userModel != null) {
          await const FlutterSecureStorage().write(
              key: AppSecureStorageKeys.userFullName,
              value: "${userModel.firstName} ${userModel.surname.toString().substring(0, 1)}."
          );
          return emit(UserLoadedState(userModel: userModel));
        } else {
          GetIt.I.get<AuthenticationBloc>().add(AppStarted());
          return emit(UserFailureState(exception: Exception()));
        }
      } on Exception catch(e, _) {
        return emit(UserFailureState(exception: e));
      }
    });

    on<UserDataUpdateEvent>((event, emit) async {
      emit(UserUpdatingState());
      try {
        bool result = await userRepository.updateUser(event.userModel.copyWith(
          id: int.parse((await const FlutterSecureStorage().read(key: AppSecureStorageKeys.objectIdKey))!)
        ));
        log(result.toString());
        if(result) {
          return emit(UserUpdatedState());
        } else {
          return emit(UserFailureState(exception: Exception("Update fail")));
        }
      } on Exception catch(e, _) {
        log(e.toString());
        return emit(UserFailureState(exception: e));
      }
    });

  }
}
