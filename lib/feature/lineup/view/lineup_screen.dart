import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/lineup/bloc/lineup_bloc.dart';
import 'package:lineneup/feature/lineup/bloc/lineup_state.dart';
import 'package:lineneup/generic/widget/app_gradient.dart';
import 'package:lineneup/generic/widget/app_progress.dart';

import '../../../generic/constant.dart';
import '../../../generic/event/model/event_model.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import '../../../library/app_screen.dart';

class LineupScreen extends Screen {
  static const String name = ScreenPath.LINEUP_SCREEN;

  LineupScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<LineupScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LineupBloc>(context).add(const InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: MobileLineupBody()),
      desktopLayout: AppGradient(child: MobileLineupBody()),
    );
  }
}

class MobileLineupBody extends StatelessWidget {
  const MobileLineupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineupBloc, LineupState>(
      builder: (context, state) {
        return state.maybeMap(loaded: (loaded) {
          return MobileLineupContent(event: loaded.event);
        }, orElse: () {
          return const AppProgress();
        });
      },
    );
  }
}

class MobileLineupContent extends StatelessWidget {
  final EventModel event;
  const MobileLineupContent({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.network(event.eventLogo),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Text(
                        event.eventName,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black, // <-- Border color
                        ),
                      ),
                      Text(
                        event.eventName,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // <-- Inner color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CurvedLinearProgressIndicator(
                      color: App.appTheme.colorSecondary,
                      strokeWidth: 6,
                      value: 0.65,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
    ;
  }
}

class DesktopLineupBody extends StatelessWidget {
  const DesktopLineupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
