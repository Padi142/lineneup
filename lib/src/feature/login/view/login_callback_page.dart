import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_state.dart';
import 'package:lineneup/src/feature/user/view/user_page.dart';
import 'package:lineneup/src/shared/navigation.dart';

class LoginCallbackPage extends StatefulWidget {
  static const String name = 'login_callback_page';

  const LoginCallbackPage({Key? key}) : super(key: key);

  @override
  State<LoginCallbackPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginCallbackPage> {
  @override
  void initState() {
    if (Uri.base.toString().contains("access_token")) {
      /// Uri.base is a auth redirect link
      BlocProvider.of<LoginBloc>(context).add(UriLogin(uri: Uri.base));
    } else {
      BlocProvider.of<LoginBloc>(context).add(const InitialEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF0F0C29),
                  Color(0xFF302B63),
                  Color(0xFF24243E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0,
                  0.2,
                  1,
                ],
              )),
              child: const MobileBody())),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
            loaded: ((user) {
              AppNavigation().push(UserPage.name, root: true);
            }),
            orElse: () {});
      },
      child: const Center(
        child: Text("Sign in in progress..",
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
