import 'package:rick_and_morty/features/domain/entities/person_entity.dart';

abstract interface class PersonRepository {
  Future<List<PersonEntity?>?> getAllPersons(int page) async {}

  Future<List<PersonEntity>>? searchPerson(String query) {}
}
