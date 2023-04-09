import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/generic/artist/model/artist_model.dart';
import 'package:lineneup/library/app.dart';

class DashboardArtistContainer extends StatelessWidget {
  final ArtistModel artist;
  const DashboardArtistContainer({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        width: 250,
        height: 450,
        child: Card(
          elevation: 2,
          color: App.appTheme.colorActive,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(artist.artistPhoto), fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                artist.artistName,
                style: App.appTheme.textHeader.copyWith(fontSize: 32),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.fade,
              ),
              const SizedBox(
                height: 15,
              ),
              const Spacer(),
              Text(
                'artist_performing_at_label'.tr(),
                style: App.appTheme.textBody.copyWith(color: App.appTheme.colorTextSecondary),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: App.appTheme.colorActive2,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    DateFormat('kk:mm').format(artist.startTime),
                    style: App.appTheme.textHeader.copyWith(fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
