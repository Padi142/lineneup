import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/event/bloc/event_bloc.dart';
import 'package:lineneup/src/shared/navigation.dart';
import 'package:lineneup/src/shared/views/components/gradient_button.dart';
import 'package:lineneup/src/shared/views/components/gradient_icon_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EventCreatePage extends StatefulWidget {
  static const String name = 'event_create_page';

  const EventCreatePage({super.key});

  @override
  State<EventCreatePage> createState() => _EventCreatePage();
}

class _EventCreatePage extends State<EventCreatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF0F0C29),
              Color(0xFF302B63),
              Color(0xFF24243E),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0,
              0.2,
              1,
            ],
          )),
          child: const MobileBody()),
    ));
  }
}

TextEditingController _nameController = TextEditingController();
String? name;
String? start;
String? end;

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientIconButton(
                  icon: Icons.arrow_left_rounded,
                  width: 20,
                  onpressed: () {
                    AppNavigation().back();
                  },
                ),
                Container()
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                labelText: 'event_name_input_label'.tr(),
              ),
              onChanged: (text) {
                name = text;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimePicker(
                type: DateTimePickerType.dateTime,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: 'event_start_input_label'.tr(),
                ),
                initialValue: '',
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'event_start_input_label'.tr(),
                onChanged: (val) {
                  start = val;
                }),
            const SizedBox(
              height: 20,
            ),
            DateTimePicker(
                type: DateTimePickerType.dateTime,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: 'event_end_input_label'.tr(),
                ),
                initialValue: start ?? '',
                firstDate:
                    start != null ? DateTime.parse(start!) : DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'event_end_input_label'.tr(),
                onChanged: (val) {
                  end = val;
                }),
            const SizedBox(
              height: 70,
            ),
            GradientButton(
              buttonText: 'create_event_button_label'.tr(),
              width: 300,
              onpressed: () {
                if (name != null && start != null && end != null) {
                  BlocProvider.of<EventBloc>(context).add(CreateEvent(
                      name!, DateTime.parse(start!), DateTime.parse(end!)));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
