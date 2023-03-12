import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_button.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../generic/widget/app_text_field/app_text_field.dart';
import '../../../generic/widget/app_text_field/validator_empty.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import '../bloc/dashboard_bloc.dart';

class EventCreationScreen extends Screen {
  static const String name = ScreenPath.EVENT_CREATION;

  EventCreationScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<EventCreationScreen> {
  @override
  void initState() {
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

  TimeOfDay selectedStartTime = TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _startTimeController = TextEditingController(text: '00:00');

  final _endDateController = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  var selectedEndDate = DateTime.now();

  TimeOfDay selectedEndTime = const TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _endTimeController = TextEditingController(text: '00:00');

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
                    Text(
                      'app_name'.tr(),
                      style: App.appTheme.textHeader,
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
                height: 15,
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    _nameTimeScreen(),
                    _logoArtistPage(),
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
          AppTextField(
            _eventTitleModel,
            filled: App.appTheme.colorNavbar,
            hint: 'event_creating_name_field_hint'.tr(),
            lines: 1,
            validators: [ValidatorEmpty()],
            beginEdit: (te) {
              te.model.error = null;
              setState(() {});
            },
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
          AppTextField(
            _eventDescriptionModel,
            filled: App.appTheme.colorNavbar,
            hint: 'event_creating_description_field_hint'.tr(),
            lines: 8,
            validators: [ValidatorEmpty()],
            beginEdit: (te) {
              te.model.error = null;
              setState(() {});
            },
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
                  _selectDate(context, selectedStartDate, _startDateController);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: App.appTheme.colorNavbar,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    style: App.appTheme.textHeader,
                    textAlign: TextAlign.center,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _startDateController,
                    onSaved: (val) {
                      print(val);
                    },
                    decoration: const InputDecoration(disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(top: 0.0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _selectTime(context, selectedStartTime, _startTimeController);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: App.appTheme.colorNavbar, borderRadius: BorderRadius.circular(5)),
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
                  _selectDate(context, selectedEndDate, _endDateController);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: App.appTheme.colorNavbar,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    style: App.appTheme.textHeader,
                    textAlign: TextAlign.center,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _startDateController,
                    onSaved: (val) {
                      print(val);
                    },
                    decoration: const InputDecoration(disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(top: 0.0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _selectTime(context, selectedEndTime, _endTimeController);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: App.appTheme.colorNavbar, borderRadius: BorderRadius.circular(5)),
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
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 50,
              width: 200,
              child: AppButton(
                onClick: () {
                  pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                },
                text: 'next_page_button_label'.tr(),
                backgroundColor: App.appTheme.colorPrimary,
                radius: 10,
                textStyle: App.appTheme.textTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoArtistPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'event_creating_name_field_title'.tr(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: App.appTheme.textHeader,
          ),
          SizedBox(
            width: 270,
            height: 50,
            child: AppButton(
              radius: 4,
              backgroundColor: App.appTheme.colorPrimary,
              imagePrefix: const Icon(Icons.add),
              onClick: () {
                BlocProvider.of<DashboardBloc>(context).add(const PickAndUploadFile(eventUid: 'vize'));
              },
            ),
          ),
          const SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 50,
              width: 150,
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
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime date, TextEditingController controller) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: date, initialDatePickerMode: DatePickerMode.day, firstDate: DateTime.now().subtract(const Duration(days: 5)), lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        date = picked;
        controller.text = DateFormat.yMd().format(date);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TimeOfDay time, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null) {
      setState(() {
        time = picked;
        controller.text = '${picked.hour}:${picked.minute}';
      });
    }
  }
}
