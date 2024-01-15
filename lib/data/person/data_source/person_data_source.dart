import 'package:car_connect/data/person/model/person_dto.dart';
import 'package:car_connect/network_config/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'person_data_source.g.dart';

@injectable
@RestApi()
abstract class PersonDataSource {
  @factoryMethod
  factory PersonDataSource(Dio dio) = _PersonDataSource;

  @GET(Endpoints.personList)
  Future<List<PersonDto>> getPersonList();
}
