import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'avatar_event.dart';
part 'avatar_state.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final UserRepository userRepository;
  AvatarBloc({required this.userRepository}) : super(AvatarInitialState()) {
    on<UserAvatarUploadEvent>((event, emit) async {
      String? avatarUrl = await userRepository.uploadAvatar(event.avatar);
      if(avatarUrl != null) {
        return emit(UserAvatarUploadedState(avatarUrl: avatarUrl));
      } else {
        return emit(UserAvatarUploadFailureState());
      }
    });
  }
}
