import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _timeoutInMilliseconds = Duration(seconds: 20);
const _baseUrl = '';
const _apiKey = '';

@module
abstract class DioConfigurationModule {
  @singleton
  BaseOptions createDioOptions() => BaseOptions(
        connectTimeout: _timeoutInMilliseconds,
        receiveTimeout: _timeoutInMilliseconds,
        sendTimeout: _timeoutInMilliseconds,
        baseUrl: _baseUrl,
        headers: const {
          'Requesting-App': 'mobile',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-apikey': String.fromEnvironment(_apiKey),
        },
      );
}
