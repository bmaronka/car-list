import 'package:car_connect/data/person/model/person_dto.dart';
import 'package:car_connect/domain/person/model/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'test mapping from PersonDto to Person',
    () {
      final personDto = PersonDto(
        'id2',
        'name2',
        'lastName2',
        DateTime(2022),
        'F',
      );
      final person = Person(
        id: 'id2',
        firstName: 'name2',
        lastName: 'lastName2',
        birthDate: DateTime(2022),
        sex: Sex.female,
      );

      expect(Person.fromPersonDto(personDto), person);
    },
  );
}
