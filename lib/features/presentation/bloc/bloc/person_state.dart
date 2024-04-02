part of 'person_bloc.dart';

sealed class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

final class PersonInitial extends PersonState {
  @override
  List<Object> get props => [];
}

final class PersonSuccess extends PersonState {
  final List<PersonEntity?> persons;

  const PersonSuccess({required this.persons});
  @override
  List<Object> get props => [persons];

  PersonSuccess copyWith(persons) {
    return PersonSuccess(persons: persons.addAll(persons));
  }
}

final class PersonLoading extends PersonState {
  @override
  List<Object> get props => [];
}

final class PersonError extends PersonState {
  final String error;

  const PersonError({required this.error});
  @override
  List<Object> get props => [error];
}
