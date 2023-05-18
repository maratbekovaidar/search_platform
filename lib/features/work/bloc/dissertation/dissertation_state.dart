part of 'dissertation_bloc.dart';

abstract class DissertationState {}

class DissertationInitialState extends DissertationState {}

class DissertationLoadingState extends DissertationState {}

class DissertationLoadedState extends DissertationState {
  final List<DissertationModel> dissertations;
  DissertationLoadedState({required this.dissertations});
}

class DissertationFailureState extends DissertationState {}
