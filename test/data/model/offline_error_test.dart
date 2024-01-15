import 'package:car_connect/data/model/offline_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'offline error is handled correctly',
    () {
      DioException offlineError = DioException(
        requestOptions: RequestOptions(path: '/fun'),
        error: OfflineError(
          DioException(
            requestOptions: RequestOptions(path: '/offline'),
          ),
        ),
      );

      expect(offlineError.isOfflineError, true);
    },
  );

  test(
    'other than offline error is handled correctly',
    () {
      DioException randomDioError = DioException(
        requestOptions: RequestOptions(path: '/xd'),
      );

      expect(randomDioError.isOfflineError, false);
    },
  );
}
