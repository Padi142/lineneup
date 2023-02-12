import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generic/artist/model/artist_model.dart';

class ArtistContainer extends StatefulWidget {
  final ArtistModel artist;
  const ArtistContainer({required this.artist, Key? key}) : super(key: key);

  @override
  State<ArtistContainer> createState() => _ArtistContainerState();
}

class _ArtistContainerState extends State<ArtistContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).highlightColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          highlightColor: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    widget.artist.artistPhoto,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )),
              Expanded(
                flex: 3,
                child: Text(
                  widget.artist.artistName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Expanded(
                child: Text(
                  DateFormat('kk:mm').format(widget.artist.startTime),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
