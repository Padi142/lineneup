import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/generic/widget/app_button.dart';
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
    return Column(
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
          height: 50,
          width: 270,
          child: AppButton(
            backgroundColor: App.appTheme.colorSecondary,
            radius: 6,
            imagePrefix:
                const SvgButton(asset: 'assets/images/discord-icon.svg'),
            text: 'Discord',
            textStyle: App.appTheme.textTitle,
            onClick: () {
              BlocProvider.of<LoginBloc>(context).add(const DiscordLogin());
            },
          ),
        )
      ],
    );
  }
}
