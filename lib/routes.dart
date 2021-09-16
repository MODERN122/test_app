import 'package:flutter/material.dart';

import 'blocs/auth/auth_page.dart';
import 'blocs/main/main_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/main': (BuildContext context) => MainPage(),
  '/auth': (BuildContext context) => AuthPage(),
  '/folder': (BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return MainPage(folderId: args['id']);
  },
};
