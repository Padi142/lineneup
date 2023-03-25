import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_text_field/app_text_field.dart';

import '../../../../library/app.dart';
import '../../model/artist_creation_model.dart';

class NewArtistContainer extends StatefulWidget {
  final Function(String name, String instagram, TimeOfDay time) onAdded;
  const NewArtistContainer({Key? key, required this.onAdded}) : super(key: key);

  @override
  State<NewArtistContainer> createState() => _NewArtistContainerState();
}

class _NewArtistContainerState extends State<NewArtistContainer> {
  late TextEntryModel artistNameModel;
  late TextEntryModel instagramModel;

  TimeOfDay selectedStartTime = TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _startTimeController = TextEditingController(text: '00:00');

  @override
  void initState() {
    artistNameModel = TextEntryModel();

    instagramModel = TextEntryModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: LayoutBuilder(
            builder: (context, constrains) {
              return Row(
                children: [
                  SizedBox(
                      width: constrains.maxWidth * 0.4,
                      child: AppTextField(
                        artistNameModel,
                        filled: App.appTheme.colorNavbar,
                        hint: 'artist_name_field_hint'.tr(),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                      width: constrains.maxWidth * 0.2,
                      child: AppTextField(
                        instagramModel,
                        filled: App.appTheme.colorNavbar,
                        hint: 'ig_field_label'.tr(),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context, selectedStartTime, _startTimeController);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.08,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: App.appTheme.colorNavbar, border: Border.all(color: App.appTheme.colorBlack)),
                      child: TextFormField(
                        style: App.appTheme.textTitle.copyWith(color: App.appTheme.colorTextSecondary),
                        textAlign: TextAlign.center,
                        onSaved: (val) {},
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _startTimeController,
                        decoration: const InputDecoration(
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: constrains.maxWidth * 0.15,
                    child: AppButton(
                      text: 'add_button_label'.tr(),
                      textStyle: App.appTheme.textBody,
                      backgroundColor: App.appTheme.colorPrimary,
                      radius: 4,
                      onClick: () {
                        widget.onAdded(artistNameModel.text, instagramModel.text, selectedStartTime);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, TimeOfDay time, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      helpText: 'artist_start_time_picker'.tr(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        time = picked;
        controller.text = '${picked.hour}:${picked.minute}';
      });
    }
  }
}

class AddedArtistContainer extends StatelessWidget {
  final ArtistCreationModel artist;
  const AddedArtistContainer({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: LayoutBuilder(
            builder: (context, constrains) {
              return Row(
                children: [
                  SizedBox(
                      width: constrains.maxWidth * 0.4,
                      child: Text(
                        artist.name,
                        style: App.appTheme.textTitle,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                      width: constrains.maxWidth * 0.2,
                      child: Text(
                        '${artist.time.hour}:${artist.time.minute}',
                        style: App.appTheme.textTitle,
                      )),
                  const Spacer(),
                  SizedBox(
                    width: constrains.maxWidth * 0.05,
                    height: 50,
                    child: AppButton(
                      backgroundColor: App.appTheme.colorError,
                      radius: 4,
                      imagePrefix: Icon(
                        Icons.delete,
                        color: App.appTheme.colorBlack,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
