part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent([List props = const []]);

  List<Object?> get props => throw UnimplementedError();
}


class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoggedIn extends AuthenticationEvent {

  final String token;


  LoggedIn({required this.token});

  @override
  String toString() => 'LoggedIn';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}