import 'package:car_connect/data/person/data_source/person_data_source.dart';
import 'package:car_connect/data/person/model/person_dto.dart';
import 'package:car_connect/data/person/service/person_service_impl.dart';
import 'package:car_connect/domain/person/model/person.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'person_service_impl_test.mocks.dart';

@GenerateMocks([
  PersonDataSource,
])
void main() {
  late PersonServiceImpl service;
  late PersonDataSource dataSource;

  setUp(() {
    dataSource = MockPersonDataSource();

    service = PersonServiceImpl(dataSource);
  });

  test(
    'get person list',
    () async {
      final personListDto = [
        PersonDto(
          'id1',
          'name1',
          'lastName1',
          DateTime(2023),
          'M',
        ),
        PersonDto(
          'id2',
          'name2',
          'lastName2',
          DateTime(2022),
          'F',
        ),
      ];
      final expected = [
        Person(
          id: 'id1',
          firstName: 'name1',
          lastName: 'lastName1',
          birthDate: DateTime(2023),
          sex: Sex.male,
        ),
        Person(
          id: 'id2',
          firstName: 'name2',
          lastName: 'lastName2',
          birthDate: DateTime(2022),
          sex: Sex.female,
        ),
      ];

      when(dataSource.getPersonList()).thenAnswer((_) => Future.value(personListDto));

      final personList = await service.getPersonList();

      expect(personList, equals(expected));
    },
    skip: 'Until connecting to backend',
  );
}
