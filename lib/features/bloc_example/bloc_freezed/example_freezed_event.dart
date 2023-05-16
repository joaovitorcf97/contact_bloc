part of 'example_freezed_bloc.dart';

@freezed
class ExampleFreezedEvent with _$ExampleFreezedEvent {
  const factory ExampleFreezedEvent.findNames() = _ExampleFreezedEventFindName;
  const factory ExampleFreezedEvent.addName(String name) =
      _ExampleFreezedEventAddName;
  const factory ExampleFreezedEvent.removeName(String name) =
      _ExampleFreezedEventRemoveName;
}
