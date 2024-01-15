import 'package:car_list/domain/db_client/database_box_name.dart';
import 'package:car_list/domain/db_client/database_client.dart';
import 'package:car_list/domain/db_client/database_key.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocaleDbDataSource {
  LocaleDbDataSource(this._databaseClient);

  final DatabaseClient _databaseClient;

  Future<void> saveLocale(String locale) => _databaseClient.putAtKey<String?>(
        boxName: DatabaseBoxName.locale,
        key: DatabaseKey.locale,
        value: locale,
      );

  Future<String?> getLocale() => _databaseClient.getWithKey<String?>(
        boxName: DatabaseBoxName.locale,
        key: DatabaseKey.locale,
      );
}
