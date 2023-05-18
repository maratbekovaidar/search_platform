part of 'dissertation_bloc.dart';

abstract class DissertationEvent {}

class DissertationLoadEvent extends DissertationEvent {
  final String? filter;
  DissertationLoadEvent({this.filter});
}