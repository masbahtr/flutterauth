import 'package:flutter/material.dart';
import 'package:flutterauth/models/login_request_model.dart';
import 'package:flutterauth/models/login_response_model.dart';
import 'package:flutterauth/repositories/login_repository.dart';
import 'package:flutterauth/utils/session_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repository = LoginRepository();
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final result = await repository.login(event.requestBody);
      result.fold((errorMessage) => emit(LoginFailed(errorMessage)), (
        loginData,
      ) {
        final sessionManager = SessionManager();
        sessionManager.saveSession(loginData.accessToken);
        emit(LoginSuccess(loginData));
      });
    });

    on<Logout>((event, emit) async {
      emit(LogoutLoading());
      final sessionManager = SessionManager();
      await sessionManager.removeAccessToken();
      emit(LogoutSuccess());
    });
  }
}
