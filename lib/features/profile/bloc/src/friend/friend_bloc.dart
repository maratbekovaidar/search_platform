import 'package:dsplatform/features/profile/domain/models/friend_request/friend_request_model.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dsplatform/features/profile/domain/repositories/friend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final FriendRepository friendRepository;

  FriendBloc({required this.friendRepository}) : super(FriendInitialState()) {
    on<FriendAddRequestEvent>((event, emit) async {
      emit(FriendLoadingState());
      try {
        bool result = await friendRepository.addFriend(event.id);
        if(result) {
          return emit(FriendRequestSuccessState());
        } else {
          return emit(FriendFailureState());
        }
      } catch (e, _) {
        return emit(FriendFailureState());
      }
    });

    on<FriendsSearchEvent>((event, emit) async {
      emit(FriendLoadingState());
      try {
        List<UserModel> users = await friendRepository.searchFriend(event.identifier);
        return emit(FriendLoadedState(friends: users));
      } on Exception catch(e, _) {
        return emit(FriendFailureState());
      }
    });

    on<FriendsLoadEvent>((event, emit) async {
      emit(FriendLoadingState());
      try {
        List<UserModel> friends = await friendRepository.getFriends();
        return emit(FriendLoadedState(friends: friends));
      } on Exception catch(e, _) {
        return emit(FriendFailureState());
      }
    });

    on<FriendLoadRequestsEvent>((event, emit) async {
      emit(FriendLoadingState());
      try {
        List<FriendRequestModel> loadedRequests = await friendRepository.getFriendRequests();
        return emit(FriendRequestsLoadedState(loadedRequests: loadedRequests));
      } on Exception catch (e, _) {
        return emit(FriendFailureState());
      }
    });

    on<FriendUpdateRequestEvent>((event, emit) async {
      emit(FriendLoadingState());
      try {
        bool result = await friendRepository.updateFriendRequest(event.accept, event.objectId);
        if(result) {
          add(FriendLoadRequestsEvent());
        } else {
          emit(FriendFailureState());
          add(FriendLoadRequestsEvent());
        }
      } on Exception catch (e, _) {
        emit(FriendFailureState());
        add(FriendLoadRequestsEvent());
      }
    });
  }
}
