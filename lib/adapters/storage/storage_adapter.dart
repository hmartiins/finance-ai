abstract class IStorageAdapter {
  Future<T?> findById<T>(int id);
  Future<List<T>?> findAll<T>();
  Future<void> create<T>(Map<String, dynamic> value);
  Future<void> remove<T>(int id);
  Future<void> clear<T>();
  Future<void> update<T>(T value);
}
