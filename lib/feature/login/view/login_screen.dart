import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_text_field/index.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import '../../lineup/view/lineup_screen.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends Screen {
  static const String name = ScreenPath.LOGIN_SCREEN;

  LoginScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: MobileLoginBody()),
      desktopLayout: AppGradient(child: MobileLoginBody()),
    );
  }
}

class MobileLoginBody extends StatelessWidget {
  const MobileLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEntryModel(text: '');
    final passwordController = TextEntryModel(text: '');
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'app_name'.tr(),
              textAlign: TextAlign.center,
              style: App.appTheme.textHeader,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 330,
              child: AppTextField(
                emailController,
                filled: App.appTheme.colorInactive,
                hint: 'E-mail',
                validators: [ValidatorEmpty(), ValidatorEmail()],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 330,
              child: AppTextField(
                passwordController,
                filled: App.appTheme.colorInactive,
                hint: 'Password',
                validators: [ValidatorEmpty()],
                secure: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 270,
              child: AppButton(
                backgroundColor: App.appTheme.colorPrimary,
                radius: 6,
                text: 'login_button_text'.tr(),
                textStyle: App.appTheme.textTitle,
                onClick: () {
                  BlocProvider.of<LoginBloc>(context).add(EmailLogin(email: emailController.text, password: passwordController.text));
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: AppButton(
                backgroundColor: App.appTheme.colorSecondary,
                radius: 6,
                imagePrefix: const SvgButton(asset: 'assets/images/discord-icon.svg'),
                text: 'Discord',
                textStyle: App.appTheme.textTitle,
                onClick: () {
                  BlocProvider.of<LoginBloc>(context).add(const DiscordLogin());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
