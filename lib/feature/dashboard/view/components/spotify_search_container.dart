import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_progress.dart';
import 'package:lineneup/generic/widget/app_text_field/app_text_field.dart';
import 'package:lineneup/library/app.dart';

import '../../../../generic/artist/model/spotify_artist_search.dart';
import '../../bloc/artist/artist_bloc.dart';
import '../../bloc/artist/artist_bloc_state.dart';

class SpotifyArtistSearch extends StatefulWidget {
  final Function(SpotifyArtistData artistData) onPickedArtist;
  const SpotifyArtistSearch({Key? key, required this.onPickedArtist}) : super(key: key);

  @override
  State<SpotifyArtistSearch> createState() => _SpotifyArtistSearchState();
}

class _SpotifyArtistSearchState extends State<SpotifyArtistSearch> {
  final artistSearchModel = TextEntryModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: App.appTheme.colorActive,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: AppTextField(
                artistSearchModel,
                hint: 'search_field_label'.tr(),
                onChanged: (value) {
                  BlocProvider.of<ArtistBloc>(context).add(SearchArtistSpotify(name: value));
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<ArtistBloc, ArtistState>(builder: (context, state) {
              return state.maybeMap(searchedArtists: (values) {
                return ListView.builder(
                    itemCount: values.artists.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          tileColor: App.appTheme.colorNavbar,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black, width: 5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          leading: SizedBox(
                            width: 300,
                            child: Row(
                              children: [
                                values.artists[index].photos.length != 0
                                    ? Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: NetworkImage(values.artists[index].photos.first.url), fit: BoxFit.fill),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 5,
                                              color: Colors.black.withOpacity(0.6),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  values.artists[index].name,
                                  style: App.appTheme.textTitle,
                                ),
                              ],
                            ),
                          ),
                          trailing: SizedBox(
                            width: 90,
                            child: AppButton(
                              backgroundColor: App.appTheme.colorPrimary,
                              radius: 4,
                              text: 'add_button_label'.tr(),
                              textStyle: App.appTheme.textTitle,
                              onClick: () {
                                widget.onPickedArtist(values.artists[index]);
                                BlocProvider.of<ArtistBloc>(context).add(const ResetSearch());
                                artistSearchModel.controller.text = '';
                              },
                            ),
                          ),
                        ),
                      );
                    });
              }, orElse: () {
                return const AppProgress();
              });
            })
          ],
        ),
      ),
    );
  }
}
