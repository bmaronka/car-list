import 'package:car_list/constants/person_list.dart';
import 'package:car_list/data/person/data_source/person_data_source.dart';
import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/domain/person/service/person_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PersonService)
class PersonServiceImpl implements PersonService {
  final PersonDataSource _personDataSource;

  const PersonServiceImpl(
    this._personDataSource,
  );

  @override
  Future<List<Person>> getPersonList() async => personList.map(Person.fromPersonDto).toList();
  // {
  //   final personList = await _personDataSource.getPersonList();

  //   return personList.map(Person.fromPersonDto).toList(growable: false);
  // }
}
