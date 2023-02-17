import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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

class MobileLineupContent extends StatefulWidget {
  final EventModel event;
  final List<ArtistModel> artists;
  const MobileLineupContent(
      {required this.event, required this.artists, Key? key})
      : super(key: key);

  @override
  State<MobileLineupContent> createState() => _MobileLineupContentState();
}

class _MobileLineupContentState extends State<MobileLineupContent> {
  int chosenArtist = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.event.eventName,
                    style: App.appTheme.textHeader.copyWith(fontSize: 42),
                  ),
                ),
                Text(
                  'Start - 17:00',
                  style: App.appTheme.textTitle.copyWith(
                      color: App.appTheme.colorSecondary, fontSize: 17),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 10,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: App.appTheme.colorInactive,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Container(
                            width: 10,
                            height: 350,
                            decoration: BoxDecoration(
                              color: App.appTheme.colorPrimary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _getArtistPictures(widget.artists),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: App.appTheme.colorInactive,
                          borderRadius: BorderRadius.circular(25)),
                      child: ArtistInfo(
                        artist: widget.artists[chosenArtist],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End - 4:00',
                  style: App.appTheme.textTitle
                      .copyWith(color: App.appTheme.colorPrimary, fontSize: 17),
                ),
                Center(
                  child: Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getArtistPictures(List<ArtistModel> artists) {
    return artists.map((it) {
      return Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            chosenArtist = artists.indexOf(it);
            setState(() {});
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: App.appTheme.colorPrimary),
                image: DecorationImage(
                    image: NetworkImage(it.artistPhoto), fit: BoxFit.fill)),
          ),
        ),
      );
    }).toList();
  }
}

class ArtistInfo extends StatelessWidget {
  final ArtistModel artist;
  const ArtistInfo({required this.artist, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: App.appTheme.colorPrimary),
                        image: DecorationImage(
                            image: NetworkImage(artist.artistPhoto),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    artist.artistName,
                    style: App.appTheme.textTitle.copyWith(fontSize: 30),
                  )
                ],
              )),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CurvedLinearProgressIndicator(
                color: App.appTheme.colorPrimary,
                strokeWidth: 6,
                value: 0.65,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(artist.startTime),
                      style: App.appTheme.textTitle,
                    ),
                    Container(),
                    Text(
                      DateFormat('HH:mm').format(artist.endTime),
                      style: App.appTheme.textTitle,
                    ),
                  ],
                ),
              ),
            ],
          )),
          Expanded(
              flex: 6,
              child: Text(
                artist.artistDescription,
                style: App.appTheme.textBody,
              )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SvgButton(asset: 'assets/images/spotify-icon.svg'),
              SvgButton(asset: 'assets/images/instagram-icon.svg'),
              SvgButton(asset: 'assets/images/soundcloud-icon.svg'),
              SvgButton(asset: 'assets/images/applemusic-icon.svg'),
            ],
          ))
        ],
      ),
    );
  }
}

class SvgButton extends StatelessWidget {
  final String asset;
  const SvgButton({required this.asset, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset(asset),
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
