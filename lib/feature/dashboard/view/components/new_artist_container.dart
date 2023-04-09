import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_text_field/app_text_field.dart';

import '../../../../library/app.dart';
import '../../model/artist_creation_model.dart';

class NewArtistContainer extends StatefulWidget {
  final Function(String name, String instagram, TimeOfDay startTime, TimeOfDay endTime) onAdded;
  const NewArtistContainer({Key? key, required this.onAdded}) : super(key: key);

  @override
  State<NewArtistContainer> createState() => _NewArtistContainerState();
}

class _NewArtistContainerState extends State<NewArtistContainer> {
  late TextEntryModel artistNameModel;
  late TextEntryModel instagramModel;

  TimeOfDay selectedStartTime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedEndTime = TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _startTimeController = TextEditingController(text: '00:00');
  final TextEditingController _endTimeController = TextEditingController(text: '00:00');

  @override
  void initState() {
    artistNameModel = TextEntryModel();

    instagramModel = TextEntryModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: App.appTheme.colorActive,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [],
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
