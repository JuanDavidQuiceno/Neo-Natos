import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../global_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

enum Role { client, expert, guest }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? currentRoute;
  final _logger = global<Logger>();
  AuthStatus authStatus = AuthStatus.checking;

  AuthBloc() : super(AuthInitial()) {
    on<AuthInitialEvent>((event, emit) => emit(AuthInitialState()));
    on<AuthValidateEvent>(_validateState);
  }

  void _validateState(AuthValidateEvent event, Emitter<AuthState> emit) async {
    emit(AuthCheckingState());
    try {
      emit(AuthAuthenticatedState());
    } catch (e) {
      emit(AuthFinishWithError(error: e.toString()));
    }
  }
}
