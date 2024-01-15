import 'package:car_connect/domain/person/model/person.dart';
import 'package:car_connect/domain/person/service/person_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class GerCarOwnersUseCase {
  final PersonService _personService;

  const GerCarOwnersUseCase(this._personService);

  Future<List<Person>> call() => _personService.getPersonList();
}
