import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/artist/artist_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/event/event_bloc.dart';
import 'package:lineneup/feature/dashboard/view/components/new_artist_container.dart';
import 'package:lineneup/generic/widget/app_progress.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_button.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../generic/widget/app_text_field/app_text_field.dart';
import '../../../generic/widget/app_text_field/validator_empty.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import '../model/artist_creation_model.dart';
import '../use_case/dashboard_navigation.dart';
import 'components/spotify_search_container.dart';

class EventCreationScreen extends Screen {
  static const String name = ScreenPath.EVENT_CREATION;

  EventCreationScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<EventCreationScreen> {
  @override
  void initState() {
    BlocProvider.of<ArtistBloc>(context).add(const SearchInitial());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: EventCreationMobileBody()),
      desktopLayout: AppGradient(child: EventCreationMobileBody()),
    );
  }
}

class EventCreationMobileBody extends StatefulWidget {
  const EventCreationMobileBody({Key? key}) : super(key: key);

  @override
  State<EventCreationMobileBody> createState() => _EventCreationMobileBodyState();
}

class _EventCreationMobileBodyState extends State<EventCreationMobileBody> {
  final PageController pageController = PageController();
  final TextEntryModel _eventTitleModel = TextEntryModel();
  final TextEntryModel _eventDescriptionModel = TextEntryModel();

  final _startDateController = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  var selectedStartDate = DateTime.now();

  TimeOfDay selectedStartTime = const TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _startTimeController = TextEditingController(text: '00:00');

  final _endDateController = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  var selectedEndDate = DateTime.now();

  TimeOfDay selectedEndTime = const TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _endTimeController = TextEditingController(text: '00:00');

  //second page thing
  final List<ArtistCreationModel> addedArtists = [];

  //Block create button after its pressed
  bool createButtonPressed = false;

  @override
  void initState() {
    _startDateController.addListener(() {
      if (_endDateController.text == DateFormat('dd-MM-yyyy').format(DateTime.now())) {
        _endDateController.text = _startDateController.text;
        selectedEndDate = selectedStartDate;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              DashboardNavigation().goToDashboard();
                            },
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: App.appTheme.colorText,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'app_name'.tr(),
                          style: App.appTheme.textHeader,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu_rounded,
                          color: App.appTheme.colorSecondary,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    _nameTimeScreen(),
                    _logoPage(),
                    _artistsPage(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameTimeScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'event_creating_name_field_title'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          Container(
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
              _eventTitleModel,
              filled: App.appTheme.colorInactive,
              hint: 'event_creating_name_field_hint'.tr(),
              lines: 1,
              validators: [ValidatorEmpty()],
              beginEdit: (te) {
                te.model.error = null;
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'event_creating_description_field_title'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          Container(
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
              _eventDescriptionModel,
              filled: App.appTheme.colorInactive,
              hint: 'event_creating_description_field_hint'.tr(),
              keyboardType: TextInputType.multiline,
              lines: 8,
              validators: [ValidatorEmpty()],
              beginEdit: (te) {
                te.model.error = null;
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'event_creating_start_time_field_title'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _selectDate(context, selectedStartDate, _startDateController, true);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
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
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _startDateController,
                    decoration: const InputDecoration(disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(top: 0.0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _selectTime(context, selectedStartTime, _startTimeController, true);
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
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'event_creating_end_time_field_title'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _selectDate(context, selectedEndDate, _endDateController, false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
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
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _endDateController,
                    decoration: const InputDecoration(disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(top: 0.0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _selectTime(context, selectedEndTime, _endTimeController, false);
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
                    controller: _endTimeController,
                    decoration: const InputDecoration(
                        disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                        // labelText: 'Time',
                        contentPadding: EdgeInsets.all(5)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 110,
                child: AppButton(
                  onClick: () {
                    DashboardNavigation().goToDashboard();
                  },
                  text: 'cancel_button_label'.tr(),
                  backgroundColor: App.appTheme.colorSecondary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
              ),
              SizedBox(
                height: 50,
                width: 130,
                child: AppButton(
                  onClick: () {
                    if (selectedStartDate.day == selectedEndDate.day && selectedStartTime.hour >= selectedEndTime.hour) {
                      //TODO: Show error
                      return;
                    }
                    pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                  },
                  text: 'next_page_button_label'.tr(),
                  backgroundColor: App.appTheme.colorPrimary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logoPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'event_creating_logo_field_title'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          SizedBox(
            width: 270,
            height: 50,
            child: AppButton(
              radius: 4,
              backgroundColor: App.appTheme.colorInactive,
              imagePrefix: const Icon(Icons.add),
              onClick: () {
                BlocProvider.of<EventBloc>(context).add(const UploadEventCover(eventUid: 'vize'));
              },
            ),
          ),
          const SizedBox(
            height: 400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 110,
                child: AppButton(
                  onClick: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 160),
                      curve: Curves.bounceIn,
                    );
                  },
                  text: 'back_page_button_label'.tr(),
                  backgroundColor: App.appTheme.colorSecondary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: AppButton(
                  onClick: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 160),
                      curve: Curves.bounceIn,
                    );
                  },
                  text: 'next_page_button_label'.tr(),
                  backgroundColor: App.appTheme.colorPrimary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _artistsPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'artists_adding_list'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          SpotifyArtistSearch(
            onPickedArtist: (artist) {
              addedArtists.add(
                ArtistCreationModel(
                  name: artist.name,
                  instagramUrl: '',
                  spotifyUrl: artist.url,
                  spotifyImage: artist.photos.isNotEmpty ? artist.photos.first.url : 'https://media.discordapp.net/attachments/1035650959512174604/1094633761599135895/flopir.jpg',
                  startTime: const TimeOfDay(hour: 19, minute: 00),
                  endTime: const TimeOfDay(hour: 20, minute: 00),
                ),
              );
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: _getArtistContainers(addedArtists),
          ),
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 110,
                child: AppButton(
                  onClick: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 160),
                      curve: Curves.bounceIn,
                    );
                  },
                  text: 'back_page_button_label'.tr(),
                  backgroundColor: App.appTheme.colorSecondary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: AppButton(
                  onClick: () {
                    if (!createButtonPressed) {
                      BlocProvider.of<EventBloc>(context).add(CreateEvent(
                          eventName: _eventTitleModel.text,
                          description: _eventDescriptionModel.text,
                          startDate: selectedStartDate,
                          startTime: selectedStartTime,
                          endDate: selectedEndDate,
                          endTime: selectedEndTime,
                          artists: addedArtists));
                    }
                    setState(() {
                      createButtonPressed = true;
                    });
                  },
                  text: createButtonPressed ? '' : 'finish_event_creation_button'.tr(),
                  imageSuffix: createButtonPressed ? const AppProgress() : const SizedBox(),
                  backgroundColor: App.appTheme.colorPrimary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getArtistContainers(List<ArtistCreationModel> artists) {
    return artists
        .map((it) => NewArtistContainer(
              artist: it,
              onRemoved: () {
                addedArtists.remove(it);
                setState(() {});
              },
              onTimeChanged: (TimeOfDay playingAt) {
                addedArtists.map((element) {
                  if (element.props == it.props) {
                    return ArtistCreationModel(
                      name: element.name,
                      endTime: element.endTime,
                      startTime: playingAt,
                      instagramUrl: element.instagramUrl,
                      spotifyImage: element.spotifyImage,
                      spotifyUrl: element.spotifyUrl,
                    );
                  }

                  return element;
                });
              },
            ))
        .toList();
  }

  Future<void> _selectDate(BuildContext context, DateTime date, TextEditingController controller, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: date, initialDatePickerMode: DatePickerMode.day, firstDate: date, lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          selectedStartDate = picked;
        } else {
          selectedEndDate = picked;
        }

        controller.text = DateFormat.yMd().format(date);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TimeOfDay time, TextEditingController controller, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          selectedStartTime = picked;
        } else {
          selectedEndTime = picked;
        }
        controller.text = DateFormat.Hm().format(DateTime(picked.hour, picked.minute)); // Formats time as 24-hour string
      });
    }
  }
}
