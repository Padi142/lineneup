import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  void initState() {
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
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.maybeWhen(loaded: (user) {
          return Center(
            child: Text(
              user.displayName,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          );
        }, initial: (() {
          return ElevatedButton(
            onPressed: (() {
              BlocProvider.of<LoginBloc>(context).add(const GoogleLogin());
            }),
            child: const Text("log in"),
          );
        }), notLoggedIn: (() {
          return ElevatedButton(
            onPressed: (() {
              BlocProvider.of<LoginBloc>(context).add(const GoogleLogin());
            }),
            child: const Text("log in"),
          );
        }), orElse: () {
          return const Center(
            child: Text("login error"),
          );
        });
      },
    );
  }
}
