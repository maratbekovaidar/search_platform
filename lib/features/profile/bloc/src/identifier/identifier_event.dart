part of 'identifier_bloc.dart';

abstract class IdentifierEvent {}

class UserIsIdentifierFree extends IdentifierEvent {
  final String identifier;
  UserIsIdentifierFree({required this.identifier});
}

