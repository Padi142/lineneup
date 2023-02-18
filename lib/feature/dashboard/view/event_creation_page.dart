import 'package:flutter/material.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../library/app_scaffold.dart';

class EventCreationScreen extends Screen {
  static const String name = ScreenPath.EVENT_CREATION;

  EventCreationScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<EventCreationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: EventCreationMobileBody()),
      desktopLayout: AppGradient(child: EventCreationMobileBody()),
    );
  }
}

class EventCreationMobileBody extends StatelessWidget {
  const EventCreationMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
