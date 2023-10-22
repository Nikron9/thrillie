import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:l0_data/dtos/export.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO implements ISerializable {
  UserDTO(
    this.id,
  );

  final String id;

  @override
  UserDTO fromMap(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  @override
  Map<String, dynamic> toMap() => _$UserDTOToJson(this);

  @override
  String toJson() => jsonEncode(toMap());

  @override
  UserDTO fromJson(String json) => fromMap(jsonDecode(json));
}
