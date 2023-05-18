
import 'package:dsplatform/features/work/domain/models/dissertation/dissertation_model.dart';
import 'package:dsplatform/features/work/domain/repositories/dissertation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dissertation_event.dart';
part 'dissertation_state.dart';

class DissertationBloc extends Bloc<DissertationEvent, DissertationState> {
  final DissertationRepository dissertationRepository;
  DissertationBloc({required this.dissertationRepository}) : super(DissertationInitialState()) {
    on<DissertationLoadEvent>((event, emit) async {
      try {
        emit(DissertationLoadingState());
        List<DissertationModel> dissertations = await dissertationRepository.getDissertations(event.filter);
        return emit(DissertationLoadedState(dissertations: dissertations));
      } on Exception catch(e, _) {
        return emit(DissertationFailureState());
      }
    });
  }
}
