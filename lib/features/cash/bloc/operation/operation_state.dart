part of 'operation_bloc.dart';

abstract class OperationState {}

class OperationInitialState extends OperationState {}

class OperationLoadingState extends OperationState {}

class OperationLoadedState extends OperationState {
  final List<OperationModel> operations;
  OperationLoadedState({required this.operations});
}

class OperationFailureState extends OperationState {}