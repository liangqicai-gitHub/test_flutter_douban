import 'package:testdouban/generated/json/base/json_convert_content.dart';
import 'package:testdouban/generated/json/base/json_filed.dart';

class ApiResponseEntity with JsonConvert<ApiResponseEntity> {
	String resultcode;
	String reason;
	@JSONField(name: "error_code")
	double errorCode;
	dynamic result;

	T converedResultAs<T>() {


		if (T == String) {
			return result?.toString() as T;
		}

		if (T == int) {
			try {
				final rs = result?.toInt();
				return (rs is T) ? rs : null;
			} catch (e) {
				return null;
			}
		}

		if (T == double) {
			try {
				final rs = result?.toDouble();
				return (rs is T) ? rs : null;
			} catch (e) {
				return null;
			}
		}

		try {
			return JsonConvert.fromJsonAsT<T>(result);
		} catch (error){
			return null;
		}

	}

	@override
  String toString() {
    return 'ApiResponseEntity{resultcode: $resultcode, reason: $reason, errorCode: $errorCode, result: $result}';
  }
}

class ApiResponseResult with JsonConvert<ApiResponseResult> {
	String username;
	String nickname;

	@override
  String toString() {
    return 'ApiResponseResult{username: $username, nickname: $nickname}';
  }
}
