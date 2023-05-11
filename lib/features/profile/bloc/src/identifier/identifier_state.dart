part of 'identifier_bloc.dart';

abstract class IdentifierState {}

class IdentifierInitialState extends IdentifierState {}

class UserIdentifierFreeState extends IdentifierState {}

class UserIdentifierTakenState extends IdentifierState {}

class UserIdentifierCheckingState extends IdentifierState {}
