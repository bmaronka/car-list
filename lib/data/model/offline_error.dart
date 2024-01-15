import 'package:dio/dio.dart';

class OfflineError {
  final DioException originalError;

  const OfflineError(this.originalError);
}

extension OfflineErrorChecker on Object {
  bool get isOfflineError => this is DioException && (this as DioException).error is OfflineError;
}
