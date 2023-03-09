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

class MobileLineupBody extends StatefulWidget {
  const MobileLineupBody({Key? key}) : super(key: key);

  @override
  State<MobileLineupBody> createState() => _MobileLineupBodyState();
}

class _MobileLineupBodyState extends State<MobileLineupBody> {
  final _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineupBloc, LineupState>(
      builder: (context, state) {
        return state.maybeMap(loaded: (loaded) {
          return PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {});
            },
            children: [
              EventInfo(event: loaded.event),
              MobileLineupContent(
                event: loaded.event,
                artists: loaded.artists,
              ),
            ],
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
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: Text(
                'Start - 17:00',
                style: App.appTheme.textTitle
                    .copyWith(color: App.appTheme.colorSecondary, fontSize: 17),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    width: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
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
                    style: App.appTheme.textTitle.copyWith(
                        color: App.appTheme.colorPrimary, fontSize: 17),
                  ),
                  Center(
                    child: Container(),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> _getArtistPictures(List<ArtistModel> artists) {
    return artists.map((it) {
      return InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          chosenArtist = artists.indexOf(it);
          setState(() {});
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              shape: BoxShape.circle,
              border: Border.all(color: App.appTheme.colorPrimary),
              image: DecorationImage(
                  image: NetworkImage(it.artistPhoto), fit: BoxFit.fill)),
        ),
      );
    }).toList();
  }
}

class EventInfo extends StatelessWidget {
  final EventModel event;
  const EventInfo({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  event.eventName,
                  style: App.appTheme.textHeader.copyWith(fontSize: 42),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: constrains.maxWidth * 0.7,
                      height: constrains.maxHeight * 0.3,
                      child: Image.network(event.eventLogo)),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                      width: constrains.maxWidth * 0.8,
                      child: Text(event.description))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

class ArtistInfo extends StatelessWidget {
  final ArtistModel artist;
  const ArtistInfo({required this.artist, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: constraints.maxHeight * 0.23,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(artist.artistPhoto),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: SelectableText(
                            artist.artistName,
                            style:
                                App.appTheme.textTitle.copyWith(fontSize: 17),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectableText(
                          DateFormat('HH:mm').format(artist.startTime),
                          style: App.appTheme.textTitle,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.6,
                          height: 6,
                          child: LinearProgressIndicator(
                            color: App.appTheme.colorPrimary,
                            value: 0.65,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SelectableText(
                          DateFormat('HH:mm').format(artist.endTime),
                          style: App.appTheme.textTitle,
                        ),
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: SelectableText(
                artist.artistDescription,
                style: App.appTheme.textBody,
              ),
            ),
            SizedBox(
                height: constraints.maxHeight * 0.08,
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SvgButton(asset: 'assets/images/spotify-icon.svg'),
                        SvgButton(asset: 'assets/images/instagram-icon.svg'),
                        SvgButton(asset: 'assets/images/soundcloud-icon.svg'),
                        SvgButton(asset: 'assets/images/applemusic-icon.svg'),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      }),
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
        child: SvgPicture.asset(
          asset,
          width: 25,
        ),
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
