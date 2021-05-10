part of 'event_cubit.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<EventsModel> events;

  EventLoaded(this.events);

  EventLoaded copyWith({
    List<EventsModel> events,
  }) {
    return EventLoaded(
      events ?? this.events,
    );
  }
}

class EventFailed extends EventState {
  final String message;

  EventFailed(this.message);

  @override
  List<Object> get props => [message];
}
