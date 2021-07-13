part of 'age_bloc.dart';

abstract class AgeState extends Equatable {
  const AgeState();

  @override
  List<Object?> get props => [];
}

class AgeLoadSuccess extends AgeState {
  final int? age;
  final bool submitted;

  const AgeLoadSuccess({this.age, this.submitted = false});

  AgeLoadSuccess copyWith({int? age, bool? submitted}) {
    return AgeLoadSuccess(
      age: age ?? this.age,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  List<Object?> get props => [age, submitted];
}
