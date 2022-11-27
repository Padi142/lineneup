import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/event/view/event_create_page.dart';
import 'package:lineneup/src/feature/user/bloc/user_bloc.dart';
import 'package:lineneup/src/feature/user/bloc/user_state.dart';
import 'package:lineneup/src/feature/user/view/components/event_card.dart';
import 'package:lineneup/src/shared/models/event_model.dart';
import 'package:lineneup/src/shared/navigation.dart';
import 'package:lineneup/src/shared/views/components/gradient_button.dart';
import 'package:lineneup/src/shared/views/components/gradient_icon_button.dart';
import 'package:lineneup/src/shared/views/components/loading.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserPage extends StatefulWidget {
  static const String name = 'user_page';

  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    String uid = Supabase.instance.client.auth.currentUser!.id;
    BlocProvider.of<UserBloc>(context).add(GetUserEvents(uid));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
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
              child: const MobileBody())),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientIconButton(
                icon: Icons.menu,
                width: 10,
                onpressed: () {},
              ),
              GradientButton(
                buttonText: "create_event_button".tr(),
                width: 80,
                onpressed: () {
                  AppNavigation().push(EventCreatePage.name);
                },
              ),
            ],
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(loaded: (events) {
                if (events.isNotEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ResponsiveGridList(
                      shrinkWrap: false,
                      desiredItemWidth: 250,
                      minSpacing: 10,
                      children: _generateContainers(events),
                    ),
                  );
                } else {
                  return Text("no_events_label".tr());
                }
              }, initial: (() {
                return const Loading();
              }), orElse: () {
                return const Center(
                  child: Text("user error"),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

List<Widget> _generateContainers(
  List<EventModel> events,
) {
  return List.generate(events.length, (index) {
    return EventCard(
      event: events[index],
    );
  });
}
