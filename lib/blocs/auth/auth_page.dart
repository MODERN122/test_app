import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:test_app/widgets/overflow_preloader.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userNameController =
        TextEditingController(text: "misha.shins@gmail.com");
    var passwordController = TextEditingController(text: "1234modern");
    //var userNameController = TextEditingController();
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      bloc: context.read<AuthBloc>(),
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthSucceed) {
          Navigator.of(context).pushReplacementNamed('/main');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: OverlayPreloader(
            enablePreloader: state is AuthLoading,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Connect to ONLYOFFICE",
                      style: TextStyle(fontSize: 40),
                    )),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      hintText: "Enter login", labelText: "Login"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
                Expanded(child: Container()),
                TextButton(
                    onPressed: () => context.read<AuthBloc>().add(SendAuth(
                        userNameController.text, passwordController.text)),
                    child: Text("login".toUpperCase()))
              ],
            ),
          ),
        );
      },
    ));
  }
}
