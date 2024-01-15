import 'package:car_connect/data/car/model/car_dto.dart';
import 'package:car_connect/network_config/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'car_data_source.g.dart';

@injectable
@RestApi()
abstract class CarDataSource {
  @factoryMethod
  factory CarDataSource(Dio dio) = _CarDataSource;

  @GET(Endpoints.carList)
  Future<List<CarDto>> getCarList();

  @POST(Endpoints.carList)
  Future<void> addCar(@Body() CarDto carDto);
}
