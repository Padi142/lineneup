import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_state.dart';
import 'package:lineneup/src/feature/login/view/login_page.dart';
import 'package:lineneup/src/feature/user/view/user_page.dart';
import 'package:lineneup/src/shared/views/components/loading.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).add(const InitialEvent());

    Uri.base.queryParameters;

    if (Uri.base.toString().contains("access_token")) {
      /// Uri.base is a auth redirect link
      BlocProvider.of<LoginBloc>(context).add(UriLogin(uri: Uri.base));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(loaded: ((user) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserPage()),
          );
        }), notLoggedIn: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }, orElse: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      },
      child: const Loading(),
    );
  }
}
