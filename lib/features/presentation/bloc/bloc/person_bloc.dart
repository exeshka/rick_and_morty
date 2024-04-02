import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/data/repositories/person_repository_impl.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty/features/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/features/domain/usecases/get_persons_usecase.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc(this._getPersonsUseCase) : super(PersonInitial()) {
    on<GetPersons>((event, emit) async {
      try {
        List<PersonEntity?>? persons =
            await _getPersonsUseCase.getPersons(event.page);

        emit(PersonSuccess(persons: persons!));
      } catch (e) {
        emit(PersonError(error: e.toString()));
      }
    });
  }
  final GetPersonsUseCase _getPersonsUseCase;
}
