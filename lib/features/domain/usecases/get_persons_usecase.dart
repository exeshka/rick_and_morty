import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty/features/domain/repositories/person_repository.dart';

class GetPersonsUseCase {
  final PersonRepository personRepository;

  GetPersonsUseCase({required this.personRepository});

  Future<List<PersonEntity?>?> getPersons(page) async {
    return await personRepository.getAllPersons(page);
  }
}
