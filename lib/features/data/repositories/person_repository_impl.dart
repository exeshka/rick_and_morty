import 'package:rick_and_morty/config/constants/constants.dart';
import 'package:rick_and_morty/features/data/data_sources/remote/remoute_data_sourse.dart';
import 'package:rick_and_morty/features/data/models/person/person_model.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty/features/domain/repositories/person_repository.dart';
import 'package:dio/dio.dart';

class PersonRepositoryImpl implements PersonRepository {
  final RemouteDataSource remote;

  PersonRepositoryImpl({required this.remote});

  @override
  Future<List<PersonEntity?>?> getAllPersons(int page) async {
    try {
      final response = await remote.getAllPersons(page);

      List<PersonEntity> persons = (response?.data['results'] as List)
          .map((json) => PersonModel.fromJson(json).toEntity())
          .toList();

      return persons;
    } catch (e) {
      throw Exception('Ошибка: $e');
    }
  }

  @override
  Future<List<PersonEntity>>? searchPerson(String query) {
    // TODO: implement searchPerson
    throw UnimplementedError();
  }
}
