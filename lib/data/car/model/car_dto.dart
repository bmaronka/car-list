import 'dart:ui';

import 'package:car_list/domain/car/model/car.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_dto.g.dart';

@JsonSerializable()
class CarDto extends Equatable {
  final String brand;
  final String model;
  final String color;
  final String registration;
  final DateTime year;
  final String ownerId;
  final dynamic lat;
  final dynamic lng;

  const CarDto(
    this.brand,
    this.model,
    this.color,
    this.registration,
    this.year,
    this.ownerId,
    this.lat,
    this.lng,
  );

  @override
  List<Object> get props => [
        brand,
        model,
        color,
        registration,
        year,
        ownerId,
        lat,
        lng,
      ];

  factory CarDto.fromJson(Map<String, dynamic> json) => _$CarDtoFromJson(json);

  factory CarDto.fromCar(Car car) => CarDto(
        car.brand,
        car.model,
        _getColorString(car.color),
        car.registration,
        car.year ?? DateTime(2023),
        car.ownerId,
        car.lat,
        car.lng,
      );

  Map<String, dynamic> toJson() => _$CarDtoToJson(this);

  static String _getColorString(Color color) {
    final hexColor = color.value.toRadixString(16);
    final hexColorWithoutOpacity = hexColor.substring(2);
    return '#$hexColorWithoutOpacity';
  }
}
