import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

class UpcommingArtist extends StatelessWidget {
  final ArtistModel artist;
  const UpcommingArtist({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Card(
        color: Theme.of(context).highlightColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            highlightColor: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          minRadius: 30,
                          backgroundImage: NetworkImage(artist.artistPhoto),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          artist.artistName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          DateFormat('kk:mm').format(artist.startTime),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
