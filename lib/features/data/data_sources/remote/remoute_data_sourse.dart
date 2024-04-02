import 'package:dio/dio.dart';
import 'package:rick_and_morty/config/constants/constants.dart';
import 'package:rick_and_morty/features/data/models/person/person_model.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';

class RemouteDataSource {
  final Dio dio;

  RemouteDataSource(this.dio);

  Future<Response?> getAllPersons(int page) async {
    try {
      Response response = await dio.get("$url?page=$int");

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
