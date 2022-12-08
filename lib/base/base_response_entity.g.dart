import 'package:base_flutter_master/generated/json/base/json_convert_content.dart';
import 'package:base_flutter_master/base/base_response_entity.dart';

BaseResponseEntity<T> $BaseResponseEntityFromJson<T>(Map<String, dynamic> json) {
	final BaseResponseEntity<T> baseResponseEntity = BaseResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		baseResponseEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		baseResponseEntity.message = message;
	}
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		baseResponseEntity.data = data;
	}
	return baseResponseEntity;
}

Map<String, dynamic> $BaseResponseEntityToJson(BaseResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}