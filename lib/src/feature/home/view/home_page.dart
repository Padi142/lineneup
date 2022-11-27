import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/src/feature/login/view/login_page.dart';
import 'package:lineneup/src/feature/user/view/user_page.dart';
import 'package:lineneup/src/shared/navigation.dart';
import 'package:lineneup/src/shared/views/components/gradient_button.dart';
import 'package:lineneup/src/shared/views/components/gradient_icon_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  static const String name = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GradientIconButton(
              icon: Icons.menu,
              width: 10,
              onpressed: () {},
            ),
            user == "NULL"
                ? GradientButton(
                    buttonText: "log_in_button".tr(),
                    width: 60,
                    onpressed: () {
                      AppNavigation().push(LoginPage.name);
                    },
                  )
                : GradientButton(
                    buttonText: "user_logged_button".tr(),
                    width: 60,
                    onpressed: () {
                      AppNavigation().push(UserPage.name);
                    },
                  ),
          ],
        ),
        Center(
          child: Text('app_name'.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 28)),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text('app_desc'.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ],
    );
  }
}
