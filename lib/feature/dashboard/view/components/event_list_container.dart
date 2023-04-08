import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generic/event/model/event_model.dart';
import '../../../../library/app.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';

class EventContainer extends StatelessWidget {
  final EventModel event;
  const EventContainer({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return InkWell(
          onTap: () {
            BlocProvider.of<DashboardBloc>(context).add(OpenEventDetail(eventId: event.eventUid));
          },
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
                        color: App.appTheme.colorActive,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: SelectableText(
                          event.eventName,
                          style: App.appTheme.textTitle,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 4,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, top: 4, right: 12, bottom: 4),
                            child: Text(
                              DateFormat('dd.MM').format(event.startTime),
                              style: App.appTheme.textTitle.copyWith(fontWeight: FontWeight.bold, color: App.appTheme.colorBlack),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
