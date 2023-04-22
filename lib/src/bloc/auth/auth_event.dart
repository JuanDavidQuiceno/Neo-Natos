part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthChangeEvent extends AuthEvent {}

class AuthChangeRoute extends AuthEvent {
  final String? route;
  const AuthChangeRoute(this.route);
}

class AuthLogoutEvent extends AuthEvent {
  final BuildContext context;
  const AuthLogoutEvent(this.context);
}

class AuthValidateEvent extends AuthEvent {}
