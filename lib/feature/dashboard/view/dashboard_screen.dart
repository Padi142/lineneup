import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/dashboard/dashboard_bloc.dart';
import 'package:lineneup/feature/dashboard/bloc/dashboard/dashboard_state.dart';
import 'package:lineneup/generic/widget/app_button.dart';
import 'package:lineneup/generic/widget/app_progress.dart';
import 'package:lineneup/library/app_screen.dart';

import '../../../generic/constant.dart';
import '../../../generic/widget/app_gradient.dart';
import '../../../library/app.dart';
import '../../../library/app_scaffold.dart';
import 'components/event_list_container.dart';

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
                height: 5,
              ),
              SizedBox(
                height: constrains.maxHeight * 0.8,
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
              SizedBox(
                height: 50,
                width: 270,
                child: AppButton(
                  onClick: () {
                    BlocProvider.of<DashboardBloc>(context).add(const OpenEventCreation());
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
