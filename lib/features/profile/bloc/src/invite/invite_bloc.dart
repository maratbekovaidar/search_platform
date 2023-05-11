import 'package:dsplatform/features/profile/domain/models/invite/invite_model.dart';
import 'package:dsplatform/features/profile/domain/repositories/invite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_event.dart';
part 'invite_state.dart';

class InviteBloc extends Bloc<InviteEvent, InviteState> {

  final InviteRepository inviteRepository;

  InviteBloc({required this.inviteRepository}) : super(InviteInitialState()) {

    on<InviteByEmailEvent>((event, emit) async {
      emit(InviteLoadingState());
      try {
        bool inviteResult = await inviteRepository.inviteByEmail(event.email);
        if(inviteResult){
          return emit(InviteSuccessState());
        } else {
          return emit(InviteFailureState());
        }
      } catch (e, _) {
        return emit(InviteFailureState());
        // print(s);
      }

    });

    on<InviteLoadEvent>((event, emit) async {
      emit(InviteLoadingState());
      try {
        List<InviteModel> invites = await inviteRepository.getInvites();
        return emit(InviteLoadedState(invites: invites));
      } on Exception catch(e, _) {
        return emit(InviteFailureState());
      }
    });

    on<InviteRevokeEvent>((event, emit) async {
      emit(InviteLoadingState());
      try {
        bool result = await inviteRepository.revokeInvite(event.email);
        if(result) {
          add(InviteLoadEvent());
        } else {
          emit(InviteFailureState());
          add(InviteLoadEvent());
        }
      } on Exception catch(e, _) {
        emit(InviteFailureState());
        add(InviteLoadEvent());
      }
    });

  }
}
