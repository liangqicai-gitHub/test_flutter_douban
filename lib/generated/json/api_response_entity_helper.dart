import 'package:testdouban/models/api_response_entity.dart';

apiResponseEntityFromJson(ApiResponseEntity data, Map<String, dynamic> json) {
	if (json['resultcode'] != null) {
		data.resultcode = json['resultcode']?.toString();
	}
	if (json['reason'] != null) {
		data.reason = json['reason']?.toString();
	}
	if (json['error_code'] != null) {
		data.errorCode = json['error_code']?.toDouble();
	}
	if (json['result'] != null) {
		data.result = json['result'];
	}
	return data;
}

Map<String, dynamic> apiResponseEntityToJson(ApiResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultcode'] = entity.resultcode;
	data['reason'] = entity.reason;
	data['error_code'] = entity.errorCode;
	data['result'] = entity.result;
	return data;
}

apiResponseResultFromJson(ApiResponseResult data, Map<String, dynamic> json) {
	if (json['username'] != null) {
		data.username = json['username']?.toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	return data;
}

Map<String, dynamic> apiResponseResultToJson(ApiResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['username'] = entity.username;
	data['nickname'] = entity.nickname;
	return data;
}