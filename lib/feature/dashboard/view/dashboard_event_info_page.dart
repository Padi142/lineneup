import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/event/event_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/event/event_bloc_state.dart';
import 'package:lineneup/generic/widget/app_progress.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/event/model/event_model.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../generic/widget/app_text_field/app_text_field.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import '../use_case/dashboard_navigation.dart';

class DashboardEventInfo extends Screen {
  static const String name = ScreenPath.DASHBOARD_EVENT_INFO;

  DashboardEventInfo({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<DashboardEventInfo> {
  @override
  void initState() {
    BlocProvider.of<EventBloc>(context).add(const LoadEventInfo(eventId: null));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: DashboardEventInfoBody()),
      desktopLayout: AppGradient(child: DashboardEventInfoBody()),
    );
  }
}

class DashboardEventInfoBody extends StatefulWidget {
  const DashboardEventInfoBody({Key? key}) : super(key: key);

  @override
  State<DashboardEventInfoBody> createState() => _DashboardEventInfoBodyState();
}

class _DashboardEventInfoBodyState extends State<DashboardEventInfoBody> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: constrains.maxHeight * 0.07,
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
              SizedBox(
                height: constrains.maxHeight * 0.8,
                child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
                  return state.maybeMap(loadedEvent: (values) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(width: constrains.maxWidth * 0.7, height: constrains.maxHeight * 0.3, child: Image.network(values.event.eventLogo)),
                        const SizedBox(
                          width: 10,
                        ),
                        EventName(
                          constrains: constrains,
                          event: values.event,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            decoration: BoxDecoration(color: App.appTheme.colorInactive, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _EventDescription(
                                    constrains: constrains,
                                    event: values.event,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  }, error: (error) {
                    return Center(
                      child: Text(
                        error.error,
                        style: App.appTheme.textTitle,
                      ),
                    );
                  }, orElse: () {
                    return const Center(
                      child: AppProgress(),
                    );
                  });
                }),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }
}

class EventName extends StatefulWidget {
  final BoxConstraints constrains;
  final EventModel event;
  const EventName({Key? key, required this.constrains, required this.event}) : super(key: key);

  @override
  State<EventName> createState() => _EventNameState();
}

class _EventNameState extends State<EventName> {
  bool showEditButton = false;
  bool editableName = false;
  final TextEntryModel _eventNameModel = TextEntryModel();

  @override
  void initState() {
    _eventNameModel.controller.text = widget.event.eventName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (e) {
          setState(() {
            showEditButton = true;
          });
        },
        onExit: (e) {
          setState(() {
            showEditButton = false;
          });
        },
        child: SizedBox(
          width: widget.constrains.maxWidth * 0.6,
          child: Stack(
            children: [
              editableName
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppTextField(
                        _eventNameModel,
                        keyboardType: TextInputType.name,
                        filled: App.appTheme.colorInactive,
                        hint: 'event_creating_name_field_hint'.tr(),
                        beginEdit: (te) {
                          te.model.error = null;
                          setState(() {});
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        widget.event.eventName,
                        textAlign: TextAlign.center,
                        style: App.appTheme.textHeader.copyWith(fontSize: 45),
                      ),
                    ),
              showEditButton
                  ? Positioned(
                      right: 5,
                      top: 1,
                      child: editableName
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.check,
                                    color: App.appTheme.colorPrimary,
                                  ),
                                  onTap: () {
                                    BlocProvider.of<EventBloc>(context).add(UpdateEvent(type: UpdateType.eventName, eventId: widget.event.eventUid, name: _eventNameModel.controller.text));

                                    setState(() {
                                      editableName = !editableName;
                                    });
                                  },
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.edit,
                                  color: App.appTheme.colorPrimary,
                                ),
                                onTap: () {
                                  setState(() {
                                    editableName = !editableName;
                                  });
                                },
                              ),
                            ))
                  : Container()
            ],
          ),
        ));
  }
}

class _EventDescription extends StatefulWidget {
  final BoxConstraints constrains;
  final EventModel event;
  const _EventDescription({Key? key, required this.constrains, required this.event}) : super(key: key);

  @override
  State<_EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<_EventDescription> {
  bool editableDescription = false;
  bool showEditButton = false;
  final TextEntryModel _eventDescriptionModel = TextEntryModel();

  @override
  void initState() {
    _eventDescriptionModel.controller.text = widget.event.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          showEditButton = true;
        });
      },
      onExit: (e) {
        setState(() {
          showEditButton = false;
        });
      },
      child: SizedBox(
          width: widget.constrains.maxWidth * 0.8,
          child: Stack(
            children: [
              editableDescription
                  ? AppTextField(
                      _eventDescriptionModel,
                      keyboardType: TextInputType.multiline,
                      filled: App.appTheme.colorInactive,
                      hint: 'event_creating_description_field_hint'.tr(),
                      lines: 8,
                      beginEdit: (te) {
                        te.model.error = null;
                        setState(() {});
                      },
                    )
                  : Text(
                      widget.event.description,
                      textAlign: TextAlign.center,
                      style: App.appTheme.textBody,
                    ),
              showEditButton
                  ? Positioned(
                      right: 5,
                      top: 1,
                      child: editableDescription
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.check,
                                  color: App.appTheme.colorPrimary,
                                ),
                                onTap: () {
                                  BlocProvider.of<EventBloc>(context)
                                      .add(UpdateEvent(type: UpdateType.description, eventId: widget.event.eventUid, description: _eventDescriptionModel.controller.text));

                                  setState(() {
                                    editableDescription = !editableDescription;
                                  });
                                },
                              ),
                            )
                          : SizedBox(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.edit,
                                  color: App.appTheme.colorPrimary,
                                ),
                                onTap: () {
                                  setState(() {
                                    editableDescription = !editableDescription;
                                  });
                                },
                              ),
                            ))
                  : Container(),
              const SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}
