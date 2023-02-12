import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/lineup/bloc/lineup_bloc.dart';
import 'package:lineneup/feature/lineup/bloc/lineup_state.dart';
import 'package:lineneup/generic/widget/app_gradient.dart';
import 'package:lineneup/generic/widget/app_progress.dart';

import '../../../generic/artist/model/artist_model.dart';
import '../../../generic/constant.dart';
import '../../../generic/event/model/event_model.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import '../../../library/app_screen.dart';
import 'component/artist_container.dart';
import 'component/lineup_header.dart';

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
          return MobileLineupContent(
            event: loaded.event,
            artists: loaded.artists,
          );
        }, orElse: () {
          return const Center(child: AppProgress());
        });
      },
    );
  }
}

class MobileLineupContent extends StatelessWidget {
  final EventModel event;
  final List<ArtistModel> artists;
  const MobileLineupContent(
      {required this.event, required this.artists, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LineupHeader(event: event),
          Card(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'live_button_text'.tr(),
                style: App.appTheme.textHeader
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 35),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ListView.builder(
              itemCount: artists.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ArtistContainer(
                  artist: artists[index],
                );
              })
        ],
      ),
    );
  }
}

class DesktopLineupBody extends StatelessWidget {
  const DesktopLineupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
