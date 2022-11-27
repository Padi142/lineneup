import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/event/bloc/event_state.dart';
import 'package:lineneup/src/feature/event/provider/lineup_provider.dart';
import 'package:lineneup/src/shared/navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'event_event.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(const EventState.initial()) {
    on<CreateEvent>(_onCreateEvent);
  }
  EventProvider eventProvider = EventProvider();

  _onCreateEvent(CreateEvent event, Emitter<EventState> emit) async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid != null) {
      final result = await eventProvider.createEvent(
          event.name, uid, event.start, event.end);
      if (result) {
        AppNavigation().back();
        emit(const EventState.created());
      } else {
        emit(const EventState.error());
      }
    }
  }
}
