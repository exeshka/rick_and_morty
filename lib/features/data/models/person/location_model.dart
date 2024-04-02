import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';

part "location_model.g.dart";

@JsonSerializable()
class LocationModel {
  final String name;

  final String url;

  const LocationModel({required this.name, required this.url});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  LocationEntity toEntity() {
    return LocationEntity(
      name: name,
      url: url,
    );
  }
}
