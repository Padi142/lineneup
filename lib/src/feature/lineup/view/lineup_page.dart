import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lineneup/src/feature/lineup/bloc/lineup_bloc.dart';
import 'package:lineneup/src/feature/lineup/bloc/lineup_state.dart';
import 'package:lineneup/src/feature/lineup/view/components/lineup_current.dart';
import 'package:lineneup/src/feature/lineup/view/components/lineup_uncomming.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

class LineupPage extends StatefulWidget {
  const LineupPage({super.key});

  @override
  State<LineupPage> createState() => _LineupPageState();
}

class _LineupPageState extends State<LineupPage> {
  @override
  void initState() {
    BlocProvider.of<LineupBloc>(context).add(const GetLineup());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF0F0C29),
                Color(0xFF302B63),
                Color(0xFF24243E),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                0.2,
                1,
              ],
            )),
            child: BlocBuilder<LineupBloc, LineupState>(
              builder: (context, state) {
                return state.maybeMap(loaded: ((loaded) {
                  return MobileBody(
                    currentArtist: loaded.currentArtist,
                    upcommingArtists: loaded.upcommingArtists,
                  );
                }), orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
              },
            )),
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  final ArtistModel currentArtist;
  final List<ArtistModel> upcommingArtists;
  const MobileBody(
      {super.key, required this.currentArtist, required this.upcommingArtists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "VIZE 30000",
            style: GoogleFonts.quantico(color: Colors.white, fontSize: 40),
          ),
          const SizedBox(
            height: 10,
          ),
          CurvedLinearProgressIndicator(
            color: Theme.of(context).dividerColor,
            strokeWidth: 6,
            value: 0.4,
            backgroundColor: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "19:00",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              Container(),
              const Text(
                "04:00",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CurrentArtist(
            artist: currentArtist,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: upcommingArtists.length,
              itemBuilder: ((context, index) {
                return UpcommingArtist(
                  artist: upcommingArtists[index],
                );
              }))
        ],
      ),
    );
  }
}
