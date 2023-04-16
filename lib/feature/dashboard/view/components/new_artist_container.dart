import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_text_field/app_text_field.dart';

import '../../../../library/app.dart';
import '../../model/artist_creation_model.dart';

class NewArtistContainer extends StatefulWidget {
  final ArtistCreationModel artist;
  final Function() onRemoved;
  final Function(TimeOfDay playingAt) onTimeChanged;
  const NewArtistContainer({Key? key, required this.artist, required this.onRemoved, required this.onTimeChanged}) : super(key: key);

  @override
  State<NewArtistContainer> createState() => _NewArtistContainerState();
}

class _NewArtistContainerState extends State<NewArtistContainer> {
  late TextEntryModel artistNameModel;
  late TextEntryModel instagramModel;

  late TimeOfDay selectedStartTime;

  final TextEditingController _startTimeController = TextEditingController();

  @override
  void initState() {
    artistNameModel = TextEntryModel();
    instagramModel = TextEntryModel();

    selectedStartTime = widget.artist.startTime;

    _startTimeController.text = DateFormat.Hm().format(DateTime(selectedStartTime.hour, selectedStartTime.minute));

    super.initState();
  }

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
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.artist.spotifyImage ?? 'https://media.discordapp.net/attachments/1035650959512174604/1094633761599135895/flopir.jpg',
                          ),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: widget.onRemoved,
                      icon: Icon(
                        Icons.person_remove_rounded,
                        color: App.appTheme.colorPrimary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.artist.name,
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
              InkWell(
                onTap: () {
                  _selectTime(
                    context,
                    selectedStartTime,
                    _startTimeController,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: App.appTheme.colorInactive,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    style: App.appTheme.textHeader,
                    textAlign: TextAlign.center,
                    onSaved: (val) {},
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _startTimeController,
                    decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                        // labelText: 'Time',
                        contentPadding: EdgeInsets.all(5)),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: App.appTheme.colorActive2,
              //     borderRadius: BorderRadius.circular(4),
              //     boxShadow: [
              //       BoxShadow(
              //         offset: const Offset(0, 1),
              //         blurRadius: 5,
              //         color: Colors.black.withOpacity(0.6),
              //       ),
              //     ],
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8),
              //     child: Text(
              //       selectedStartTime.format(context),
              //       style: App.appTheme.textHeader.copyWith(fontSize: 40),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
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
      controller.text = DateFormat.Hm().format(DateTime(picked.hour, picked.minute));
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
                        '${artist.startTime.hour}:${artist.startTime.minute}',
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
