import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/home/bloc/home_bloc.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/library/app_scaffold.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../generic/widget/app_gradient_button.dart';
import '../../../generic/widget/app_progress.dart';
import '../../../library/app.dart';
import '../../../library/app_screen.dart';

class HomeScreen extends Screen {
  static const String name = ScreenPath.HOME_SCREEN;

  HomeScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: DesktopHomeBody()),
      desktopLayout: AppGradient(child: DesktopHomeBody()),
    );
  }
}

class MobileHomeBody extends StatelessWidget {
  const MobileHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: AppProgress(),
      ),
    );
  }
}

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'app_name'.tr(),
                  style: App.appTheme.textHeader,
                ),
                AppButton(
                  backgroundColor: App.appTheme.colorSecondary,
                  text: 'log_in_button'.tr(),
                  textStyle: App.appTheme.textTitle,
                  onClick: () {
                    BlocProvider.of<HomeBloc>(context).add(const GoToLogin());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'home_leading_text'.tr(),
            textAlign: TextAlign.center,
            style: App.appTheme.textSuperHeader.copyWith(fontSize: 40),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'home_trailing_text'.tr(),
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader
                .copyWith(color: App.appTheme.colorTextSecondary),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 70,
            child: AppGradientButton(
              buttonText: 'sign_up_button'.tr(),
              radius: 5,
              colors: [App.appTheme.colorPrimary, App.appTheme.colorSecondary],
              onPressed: () {},
              width: 200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.network(
              'https://media.discordapp.net/attachments/1033387401407627374/1057424593322774598/New_Project.png')
        ],
      ),
    );
  }
}
