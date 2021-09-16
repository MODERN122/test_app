import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/models/profile.dart';
import 'package:test_app/repositories/user_reposiotry.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(UserInitial());
  UserRepository userRepository;
  late Profile profile;
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUser) {
      try {
        yield UserLoading();
        profile = await userRepository.getProfile();
        yield UserSucceed(profile);
      } on Exception catch (e) {
        yield UserError(e.toString());
      }
    }
  }
}
