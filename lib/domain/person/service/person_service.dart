import 'package:car_list/domain/person/model/person.dart';

abstract class PersonService {
  Future<List<Person>> getPersonList();
}
