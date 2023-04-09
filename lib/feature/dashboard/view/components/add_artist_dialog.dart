import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/generic/widget/app_text_field/app_text_field.dart';
import 'package:lineneup/generic/widget/app_text_field/validator_empty.dart';
import 'package:lineneup/library/app.dart';

Widget addArtistDialog(BuildContext context) {
  final TextEntryModel artistNameModel = TextEntryModel();
  final TextEntryModel artistInstagramModel = TextEntryModel();
  final TextEntryModel artistSpotifyModel = TextEntryModel();
  return AlertDialog(
    backgroundColor: App.appTheme.colorInactive,
    title: Text(
      'add_artist_page_title'.tr(),
      style: App.appTheme.textHeader,
    ),
    content: Column(
      children: [
        Text(
          'artist_name_field_hint'.tr(),
          textAlign: TextAlign.center,
          style: App.appTheme.textHeader,
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
          child: AppTextField(
            artistNameModel,
            filled: App.appTheme.colorInactive,
            hint: 'artist_name_field_hint'.tr(),
            lines: 1,
            validators: [ValidatorEmpty()],
            beginEdit: (te) {
              te.model.error = null;
            },
          ),
        ),
        Wrap(
          children: [
            Column(
              children: [
                Text(
                  'ig_field_label'.tr(),
                  textAlign: TextAlign.center,
                  style: App.appTheme.textHeader,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                  child: AppTextField(
                    artistNameModel,
                    filled: App.appTheme.colorInactive,
                    hint: 'ig_field_label'.tr(),
                    lines: 1,
                    validators: [ValidatorEmpty()],
                    beginEdit: (te) {
                      te.model.error = null;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'ig_field_label'.tr(),
                  textAlign: TextAlign.center,
                  style: App.appTheme.textHeader,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                  child: AppTextField(
                    artistNameModel,
                    filled: App.appTheme.colorInactive,
                    hint: 'ig_field_label'.tr(),
                    lines: 1,
                    validators: [ValidatorEmpty()],
                    beginEdit: (te) {
                      te.model.error = null;
                    },
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
