import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../library/app.dart';
import '../../../library/app_screen.dart';

class UnknownScreen extends Screen {
  static const String name = ScreenPath.UNKNOWN_SCREEN;

  UnknownScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _UnknownScreenState();
}

class _UnknownScreenState extends State<UnknownScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradient(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('unknown_screen__title'.tr(), style: App.appTheme.textHeader),
                const SizedBox(height: 32),
                Text('unknown_screen__message'.tr(), style: App.appTheme.textTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
