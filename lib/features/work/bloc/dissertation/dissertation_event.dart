part of 'dissertation_bloc.dart';

abstract class DissertationEvent {}

class DissertationLoadEvent extends DissertationEvent {
  final String? filter;
  DissertationLoadEvent({this.filter});
}

class DissertationSaveEvent extends DissertationEvent {
  final DissertationModel dissertationModel;
  DissertationSaveEvent(this.dissertationModel);
}

class DissertationLoadFromBookmarksEvent extends DissertationEvent {

}