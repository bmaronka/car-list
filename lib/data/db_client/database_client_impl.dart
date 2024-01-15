import 'package:car_list/domain/db_client/database_client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DatabaseClient)
class DatabaseClientImpl implements DatabaseClient {
  const DatabaseClientImpl();

  @override
  Future<T?> getWithKey<T>({
    required String boxName,
    required String key,
  }) {
    late Box<T> openedBox;
    late T? openedResult;

    return _openBox<T>(name: boxName)
        .then((box) => openedBox = box)
        .then((_) => openedResult = openedBox.get(key.toLowerCase(), defaultValue: null))
        .then((_) => openedResult);
  }

  @override
  Future<void> putAtKey<T>({
    required String boxName,
    required String key,
    required T value,
  }) {
    late Box<T> openedBox;

    return _openBox<T>(name: boxName)
        .then((box) => openedBox = box)
        .then((_) => openedBox.put(key.toLowerCase(), value));
  }

  Future<Box<T>> _openBox<T>({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      return Hive.box(name);
    }
    return Hive.openBox<T>(name);
  }
}
