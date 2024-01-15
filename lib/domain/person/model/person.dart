import 'package:car_list/data/person/model/person_dto.dart';
import 'package:car_list/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

const _apiMaleLetter = 'M';
const _apiFemaleLetter = 'F';

enum Sex {
  male,
  female;

  static Sex fromString(String sex) {
    switch (sex) {
      case _apiMaleLetter:
        return Sex.male;
      case _apiFemaleLetter:
        return Sex.female;

      default:
        return Sex.male;
    }
  }

  Color get color => switch (this) {
        Sex.male => Colors.red.shade400,
        Sex.female => Colors.blue.shade400,
      };

  String get sexLetter => switch (this) {
        Sex.male => Strings.current.maleLetter,
        Sex.female => Strings.current.femaleLetter,
      };
}

@freezed
class Person with _$Person {
  factory Person({
    required String id,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required Sex sex,
  }) = _Person;

  factory Person.fromPersonDto(PersonDto personDto) => Person(
        id: personDto.id,
        firstName: personDto.firstName,
        lastName: personDto.lastName,
        birthDate: personDto.birthDate,
        sex: Sex.fromString(personDto.sex),
      );
}

extension PersonExt on Person {
  String get displayName => '$firstName $lastName';
}
