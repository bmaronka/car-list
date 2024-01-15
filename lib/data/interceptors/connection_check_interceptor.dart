import 'package:car_connect/data/model/offline_error.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionCheckInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final bool isOffline = (err.type != DioExceptionType.badResponse && err.type != DioExceptionType.cancel) &&
        !await InternetConnectionChecker().hasConnection;

    if (isOffline) {
      handler.next(
        DioException(
          requestOptions: err.requestOptions,
          error: OfflineError(err),
        ),
      );
    } else {
      super.onError(err, handler);
    }
  }
}
