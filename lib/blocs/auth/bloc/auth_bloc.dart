import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthInitial());

  bool isRegistration = false;
  final AuthRepository authRepository;
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // if (event is CheckAuth) {
    //   ///TODO: убрать строку ниже и расскоментить блок под ней.
    //   yield AuthSucceed();
    //   bool auth = await authRepository.checkAuth();
    //   if (auth) {
    //     yield AuthSucceed();
    //   } else {
    //     yield Authorization();
    //   }
    // } else
    if (event is SendAuth) {
      yield AuthLoading();
      try {
        bool result =
            await authRepository.login(event.userName, event.password);
        if (!result)
          yield AuthError("Возникла ошибка");
        else
          yield AuthSucceed();
      } catch (e) {
        yield AuthError(e.toString());
      }
    }
  }
}
