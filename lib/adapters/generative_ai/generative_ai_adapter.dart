abstract class IGenerativeAIAdapter {
  Future<T?> transformTextToEntity<T>(
    String text,
    String jsonTemplate,
    T Function(Map<String, dynamic>) fromJson,
  );
}
