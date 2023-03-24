import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/feature/dashboard/model/artist_creation_model.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_text_field/app_text_field.dart';

import '../../../../library/app.dart';

class ArtistInfoContainer extends StatefulWidget {
  final ArtistCreationModel? artist;
  const ArtistInfoContainer({Key? key, required this.artist}) : super(key: key);

  @override
  State<ArtistInfoContainer> createState() => _ArtistInfoContainerState();
}

class _ArtistInfoContainerState extends State<ArtistInfoContainer> {
  late TextEntryModel artistNameModel;
  late TextEntryModel instagramModel;

  @override
  void initState() {
    artistNameModel =
        TextEntryModel(text: widget.artist != null ? widget.artist!.name : '');

    instagramModel = TextEntryModel(
        text: widget.artist != null ? widget.artist!.instagramUrl : '');

    super.initState();
  }

  final TextEntryModel artistIgModel = TextEntryModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
          //set border radius more than 50% of height and width to make circle
        ),
        child: ListTile(
          tileColor: App.appTheme.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                SizedBox(
                    height: 20,
                    width: 50,
                    child: AppTextField(
                      artistNameModel,
                      hint: 'artist_name_field_hint'.tr(),
                    )),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                    height: 20,
                    width: 120,
                    child: AppTextField(
                      artistIgModel,
                      hint: 'ig_field_label'.tr(),
                    )),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          trailing: AppButton(
            text: 'add_button_label'.trim(),
            backgroundColor: App.appTheme.colorPrimary,
            radius: 4,
            onClick: () {},
          ),
        ),
      ),
    );
  }
}
