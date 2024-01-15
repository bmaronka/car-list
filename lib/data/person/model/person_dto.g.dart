// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => PersonDto(
      json['_id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      DateTime.parse(json['birth_date'] as String),
      json['sex'] as String,
    );
