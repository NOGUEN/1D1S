import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import '/flavors/build_config.dart';
import 'exceptions/api_exception.dart';
import 'exceptions/app_exception.dart';
import 'exceptions/network_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/service_unavailable_exception.dart';

Exception handleError(String error) {
  final logger = BuildConfig.instance.config.logger;
  logger.e("제네릭 오류: $error");

  return AppException(message: error);
}

Exception handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException(message: "서버로 보내는 API요청이 취소되었습니다");
    case DioExceptionType.connectionTimeout:
      return AppException(message: "커넥션 타임아웃이 발생했습니다");
    case DioExceptionType.unknown:
      return NetworkException("네트워크에 연결하지 못했습니다");
    case DioExceptionType.receiveTimeout:
      return TimeoutException("리시브 타임아웃이 발생했습니다");
    case DioExceptionType.sendTimeout:
      return TimeoutException("센드 타임아웃이 발생했습니다");
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
    default:
      return AppException(message: "정의된 오류 외의 에러가 발생했습니다");
  }
}

Exception _parseDioErrorResponse(DioException dioError) {
  final logger = BuildConfig.instance.config.logger;

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "무언가 잘못되었습니다.다시 시도해주세요";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("서비스를 일시적으로 이용할 수 없습니다");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    default:
      return ApiException(
          httpCode: statusCode,
          status: status ?? "",
          message: serverMessage ?? "");
  }
}
