import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/library/app_scaffold.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_progress.dart';
import '../../../library/app.dart';
import '../../../library/app_screen.dart';
import '../bloc/init_bloc.dart';

class InitScreen extends Screen {
  static const String name = ScreenPath.INIT_SCREEN;

  InitScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<InitBloc>(context).add(const InitApplication());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            App.appTheme.colorBackground1,
            App.appTheme.colorBackground2,
            App.appTheme.colorBackground3,
          ],
        ),
      ),
      child: const AppScaffold(
        mobileLayout: MobileInitBody(),
      ),
    );
  }
}

class MobileInitBody extends StatelessWidget {
  const MobileInitBody({Key? key}) : super(key: key);

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
