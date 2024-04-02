part of 'person_bloc.dart';

sealed class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class GetPersons extends PersonEvent {
  final int page;

  GetPersons({required this.page});
}
