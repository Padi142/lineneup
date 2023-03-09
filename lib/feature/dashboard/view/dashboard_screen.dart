import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/dashboard_state.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_progress.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/event/model/event_model.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';

class DashboardScreen extends Screen {
  static const String name = ScreenPath.DASHBOARD_SCREEN;

  DashboardScreen({Key? key}) : super(name, key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context).add(const Initial());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      mobileLayout: AppGradient(child: DashboardBody()),
      desktopLayout: AppGradient(child: DashboardBody()),
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

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
              SizedBox(
                height: constrains.maxHeight * 0.7,
                child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                  return state.maybeMap(loaded: (values) {
                    return ListView.builder(
                        itemCount: values.events.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(height: constrains.maxHeight * 0.35, child: EventContainer(event: values.events[index]));
                        });
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
              const Spacer(),
              SizedBox(
                height: 50,
                width: 270,
                child: AppButton(
                  onClick: () {
                    BlocProvider.of<DashboardBloc>(context).add(const EventCreation());
                  },
                  text: 'create_new_event_label'.tr(),
                  backgroundColor: App.appTheme.colorSecondary,
                  radius: 10,
                  textStyle: App.appTheme.textTitle,
                ),
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

class EventContainer extends StatelessWidget {
  final EventModel event;
  const EventContainer({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    event.eventLogo,
                    fit: BoxFit.cover,
                    width: constrains.maxWidth,
                    height: constrains.maxHeight * 0.55,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: constrains.maxWidth,
                    height: constrains.maxHeight * 0.45,
                    child: Container(
                      decoration: BoxDecoration(
                        color: App.appTheme.colorInactive,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          SelectableText(
                            event.eventName,
                            style: App.appTheme.textTitle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SelectableText(
                              event.description,
                              textAlign: TextAlign.center,
                              style: App.appTheme.textBody,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
