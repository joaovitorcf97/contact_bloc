import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_freezed_state.dart';
part 'example_freezed_event.dart';
part 'example_freezed_bloc.freezed.dart';

class ExampleFreezedBloc
    extends Bloc<ExampleFreezedEvent, ExampleFreezedState> {
  ExampleFreezedBloc() : super(ExampleFreezedState.initial()) {
    on<_ExampleFreezedEventFindName>(_findNames);
    on<_ExampleFreezedEventAddName>(_addName);
    on<_ExampleFreezedEventRemoveName>(_removeNames);
  }

  FutureOr<void> _addName(
    _ExampleFreezedEventAddName event,
    Emitter<ExampleFreezedState> emit,
  ) async {
    final names = state.maybeWhen(
      data: (names) => names,
      orElse: () => const <String>[],
    );

    emit(ExampleFreezedState.showBanner(
      names: names,
      message: 'Aguarde, nome sendo inserido...',
    ));
    await Future.delayed(const Duration(seconds: 3));

    final newNames = [...names];
    newNames.add(event.name);

    emit(ExampleFreezedState.data(names: newNames));
  }

  FutureOr<void> _removeNames(
    _ExampleFreezedEventRemoveName event,
    Emitter<ExampleFreezedState> emit,
  ) {
    final names = state.maybeWhen(
      data: (names) => names,
      orElse: () => const <String>[],
    );

    final newNames = [...names];

    newNames.retainWhere((element) => element != event.name);
    emit(ExampleFreezedState.data(names: newNames));
  }

  Future<void> _findNames(
    _ExampleFreezedEventFindName event,
    Emitter<ExampleFreezedState> emit,
  ) async {
    emit(ExampleFreezedState.loading());

    final names = ['João', 'Ana', 'Gabriel'];

    await Future.delayed(const Duration(seconds: 3));

    emit(ExampleFreezedState.data(names: names));
  }
}
