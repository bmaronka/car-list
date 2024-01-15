import 'package:car_connect/domain/person/model/person.dart';
import 'package:car_connect/domain/person/service/person_service.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

@injectable
class GerCarOwnerUseCase {
  final PersonService _personService;

  const GerCarOwnerUseCase(this._personService);

  Future<Person?> call(String ownerId) async {
    final personList = await _personService.getPersonList();

    return personList.firstWhereOrNull((person) => person.id == ownerId);
  }
}
