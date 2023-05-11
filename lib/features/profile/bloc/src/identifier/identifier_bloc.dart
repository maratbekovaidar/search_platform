import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'identifier_event.dart';
part 'identifier_state.dart';

class IdentifierBloc extends Bloc<IdentifierEvent, IdentifierState> {
  final UserRepository userRepository;
  IdentifierBloc({required this.userRepository}) : super(IdentifierInitialState()) {

    on<UserIsIdentifierFree>((event, emit) async {
      emit(UserIdentifierCheckingState());
      bool isIdentifier = await userRepository.isIdentifierFree(event.identifier);
      if(isIdentifier) {
        return emit(UserIdentifierFreeState());
      } else {
        return emit(UserIdentifierTakenState());
      }
    });

  }
}
