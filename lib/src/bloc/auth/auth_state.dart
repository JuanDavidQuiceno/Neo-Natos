part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {}

class AuthCheckingState extends AuthState {}

class AuthFinishWithError extends AuthState {
  final String error;

  const AuthFinishWithError({required this.error});

  @override
  List<Object> get props => [error];
}
