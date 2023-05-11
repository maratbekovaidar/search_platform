import 'package:dsplatform/features/cash/domain/models/operation/operation_model.dart';
import 'package:dsplatform/features/cash/domain/repositories/operation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'operation_event.dart';
part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  final OperationRepository operationRepository;
  OperationBloc({required this.operationRepository}) : super(OperationInitialState()) {
    on<OperationLoadEvent>((event, emit) async {
      emit(OperationLoadingState());
      try {
        List<OperationModel> loadedOperations = await operationRepository.getOperations();
        loadedOperations.sort((a, b) => b.created.compareTo(a.created));
        return emit(OperationLoadedState(operations: loadedOperations));
      } on Exception catch(e, _) {
        return emit(OperationFailureState());
      }
    });
  }
}
