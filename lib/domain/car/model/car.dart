import 'package:car_connect/data/car/model/car_dto.dart';
import 'package:car_connect/utils/date_time_formatter.dart';
import 'package:car_connect/utils/to_double_converter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hexcolor/hexcolor.dart';

part 'car.freezed.dart';

@freezed
class Car with _$Car {
  factory Car({
    required String brand,
    required String model,
    required Color color,
    required String registration,
    required String ownerId,
    DateTime? year,
    double? lat,
    double? lng,
  }) = _Car;

  factory Car.fromCarDto(CarDto carDto) => Car(
        brand: carDto.brand,
        model: carDto.model,
        color: HexColor(carDto.color),
        registration: carDto.registration,
        year: carDto.year,
        ownerId: carDto.ownerId,
        lat: convertToDouble(carDto.lat),
        lng: convertToDouble(carDto.lng),
      );

  factory Car.empty() => Car(
        brand: '',
        model: '',
        color: Colors.black,
        registration: '',
        year: null,
        ownerId: '',
      );
}

extension CarExt on Car {
  String get displayName => '$brand $model';

  Color get tintColor => color.withOpacity(.1);

  String? get yearString => year != null ? DateTimeFormatter.year(year!) : null;

  String get colorString => '#${color.value.toRadixString(16)}';

  String? get locationString =>
      lat != null && lng != null ? '${lat?.toStringAsFixed(2)}, ${lng?.toStringAsFixed(2)}' : null;
}
