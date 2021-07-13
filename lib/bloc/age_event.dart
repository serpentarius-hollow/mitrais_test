part of 'age_bloc.dart';

abstract class AgeEvent extends Equatable {
  const AgeEvent();

  @override
  List<Object> get props => [];
}

class AgeChanged extends AgeEvent {
  final String value;

  const AgeChanged(this.value);
}

class AgeSubmitted extends AgeEvent {}
