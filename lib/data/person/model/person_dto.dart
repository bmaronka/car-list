import 'package:json_annotation/json_annotation.dart';

part 'person_dto.g.dart';

@JsonSerializable(createToJson: false)
class PersonDto {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'birth_date')
  final DateTime birthDate;
  final String sex;

  const PersonDto(
    this.id,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.sex,
  );

  factory PersonDto.fromJson(Map<String, dynamic> json) => _$PersonDtoFromJson(json);
}
