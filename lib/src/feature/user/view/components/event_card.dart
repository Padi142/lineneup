import 'package:flutter/material.dart';
import 'package:lineneup/src/feature/lineup/view/lineup_page.dart';
import 'package:lineneup/src/shared/models/event_model.dart';
import 'package:lineneup/src/shared/navigation.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            highlightColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              AppNavigation().pushByPath("/${event.eventUid}");
            },
            child: SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(event.eventLogo),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        event.eventName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        event.eventUid,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]))));
  }
}
