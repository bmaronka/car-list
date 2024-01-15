import 'package:car_connect/domain/person/model/person.dart';

abstract class PersonService {
  Future<List<Person>> getPersonList();
}
