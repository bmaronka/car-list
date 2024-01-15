abstract class DatabaseClient {
  Future<void> putAtKey<T>({required String boxName, required String key, required T value});

  Future<T?> getWithKey<T>({required String boxName, required String key});
}
