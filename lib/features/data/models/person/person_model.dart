import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/data/models/person/location_model.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';

part "person_model.g.dart";

@JsonSerializable()
class PersonModel {
  final int id;

  final String name;

  final String status;

  final String species;

  final String type;

  final String gender;

  final LocationModel origin;

  final LocationModel location;

  final String image;

  final List<String> episode;

  final DateTime created;

  final String url;

  PersonModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.created,
      required this.url});

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  PersonEntity toEntity() {
    return PersonEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toEntity(),
      location: location.toEntity(),
      image: image,
      episode: episode,
      created: created,
      url: url,
    );
  }
}
