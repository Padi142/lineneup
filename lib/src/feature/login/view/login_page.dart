import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/login/bloc/login_bloc.dart';
import 'package:lineneup/src/shared/views/components/gradient_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  static const String name = 'login_page';

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
    String user = Supabase.instance.client.auth.currentUser?.email ?? "NULL";
    return Column(
      children: [
        const Center(
          child: Text("Log in to be able to create events",
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        GradientButton(
          buttonText: "log_in_button".tr(),
          width: 250,
          onpressed: () {
            BlocProvider.of<LoginBloc>(context).add(const GoogleLogin());
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Text("Current user: $user",
              style: const TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ],
    );
  }
}
