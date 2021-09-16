import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/main/bloc/main_bloc.dart';
import 'package:test_app/blocs/main/bloc/user_bloc.dart';
import 'package:test_app/repositories/auth_repository.dart';
import 'package:test_app/repositories/document_repository.dart';
import 'package:test_app/repositories/user_reposiotry.dart';
import 'package:test_app/routes.dart';
import 'package:test_app/services/storage/storage.dart';

import 'blocs/auth/bloc/auth_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Storage storage = Storage();
    DocumentRepository documentRepository = DocumentRepository();
    AuthRepository authRepository = AuthRepository(storage: storage);
    UserRepository userRepository = UserRepository();

    return RepositoryProvider(
      create: (context) => authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) =>
                AuthBloc(authRepository: authRepository),
          ),
          BlocProvider<MainBloc>(
            create: (BuildContext context) =>
                MainBloc(documentRepository: documentRepository),
          ),
          BlocProvider<UserBloc>(
            create: (BuildContext context) =>
                UserBloc(userRepository: userRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          initialRoute: '/auth',
          routes: routes,
        ),
      ),
    );
  }
}
