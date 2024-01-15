import 'package:car_list/domain/db_client/database_client.dart';
import 'package:car_list/injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DatabaseClientInitializer {
  static Future<DatabaseClient> create() async => path_provider
      .getApplicationDocumentsDirectory()
      .then((directory) => Hive.init(directory.path))
      .then((_) => getIt<DatabaseClient>());
}
