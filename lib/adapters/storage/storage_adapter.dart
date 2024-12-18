abstract class IStorageAdapter {
  Future<T?> findById<T>(int id);
  Future<List<T>?> findAll<T>();
  Future<void> create<T>(T value);
  Future<void> remove<T>(int id);
  Future<void> clear<T>();
  Future<void> update<T>(T value);
}
