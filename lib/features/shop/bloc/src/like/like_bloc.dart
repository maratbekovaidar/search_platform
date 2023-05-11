
import 'package:flutter_bloc/flutter_bloc.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitialState()) {
    on<LikeLoadEvent>((event, emit) {

    });
  }
}
