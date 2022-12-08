import 'package:base_flutter_master/generated/json/base/json_field.dart';
import 'dart:convert';

import 'base_response_entity.g.dart';

@JsonSerializable()
class BaseResponseEntity<T> {

	int? code;
	String? message;
	T? data;
  
  BaseResponseEntity();

  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) => $BaseResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}