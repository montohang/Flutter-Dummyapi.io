part of 'event_team_cubit.dart';

abstract class EventTeamState extends Equatable {
  const EventTeamState();

  @override
  List<Object> get props => [];
}

class EventTeamInitial extends EventTeamState {}

class EventTeamLoading extends EventTeamState {}

class EventTeamLoaded extends EventTeamState {
  final List<EventTeamModel> events;

  EventTeamLoaded(this.events);

  EventTeamLoaded copyWith({
    List<EventTeamModel> events,
  }) {
    return EventTeamLoaded(
      events ?? this.events,
    );
  }
}

class EventTeamFailed extends EventTeamState {
  final String message;

  EventTeamFailed(this.message);

  @override
  List<Object> get props => [message];
}
