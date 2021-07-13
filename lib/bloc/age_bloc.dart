import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'age_event.dart';
part 'age_state.dart';

class AgeBloc extends Bloc<AgeEvent, AgeState> {
  AgeBloc() : super(AgeLoadSuccess());

  @override
  Stream<AgeState> mapEventToState(
    AgeEvent event,
  ) async* {
    final currentState = state;

    if (event is AgeChanged) {
      if (currentState is AgeLoadSuccess) {
        final age = int.parse(event.value);

        yield currentState.copyWith(age: age, submitted: false);
      }
    }

    if (event is AgeSubmitted) {
      if (currentState is AgeLoadSuccess) {
        yield currentState.copyWith(submitted: true);
      }
    }
  }
}
