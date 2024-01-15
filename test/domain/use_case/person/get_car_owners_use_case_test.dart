import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/domain/person/service/person_service.dart';
import 'package:car_list/domain/use_case/person/get_car_owners_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_car_owner_use_case_test.mocks.dart';

@GenerateMocks([
  PersonService,
])
void main() {
  late PersonService service;
  late GerCarOwnersUseCase gerCarOwnersUseCase;

  setUp(() {
    service = MockPersonService();
    gerCarOwnersUseCase = GerCarOwnersUseCase(service);
  });

  final person1 = Person(
    id: 'id1',
    firstName: 'name1',
    lastName: 'lastName1',
    birthDate: DateTime(2023),
    sex: Sex.male,
  );
  final person2 = Person(
    id: 'id2',
    firstName: 'name2',
    lastName: 'lastName2',
    birthDate: DateTime(2022),
    sex: Sex.female,
  );

  final personList = [
    person1,
    person2,
  ];

  test(
    'get car owners successfully',
    () async {
      when(service.getPersonList()).thenAnswer((_) => Future.value(personList));

      expect(await gerCarOwnersUseCase(), personList);
    },
  );
}
