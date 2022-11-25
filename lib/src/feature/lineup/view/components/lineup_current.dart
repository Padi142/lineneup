import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

class CurrentArtist extends StatelessWidget {
  final ArtistModel artist;
  const CurrentArtist({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
          highlightColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      minRadius: 35,
                      backgroundImage: NetworkImage(artist.artistPhoto),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      artist.artistName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: CurvedLinearProgressIndicator(
                    color: Theme.of(context).dividerColor,
                    strokeWidth: 6,
                    value: 0.65,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        artist.startTime.hour.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      Container(),
                      Text(
                        artist.endTime.hour.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
