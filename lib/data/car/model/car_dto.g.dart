// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDto _$CarDtoFromJson(Map<String, dynamic> json) => CarDto(
      json['brand'] as String,
      json['model'] as String,
      json['color'] as String,
      json['registration'] as String,
      DateTime.parse(json['year'] as String),
      json['ownerId'] as String,
      json['lat'],
      json['lng'],
    );

Map<String, dynamic> _$CarDtoToJson(CarDto instance) => <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'registration': instance.registration,
      'year': instance.year.toIso8601String(),
      'ownerId': instance.ownerId,
      'lat': instance.lat,
      'lng': instance.lng,
    };
