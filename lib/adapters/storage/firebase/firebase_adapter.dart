// TODO: Refatorar para usar command pattern e result pattern.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_ai/adapters/storage/storage_adapter.dart';
import 'package:logging/logging.dart';

class FirebaseAdapter implements IStorageAdapter {
  final FirebaseFirestore firestore;

  FirebaseAdapter({
    required this.firestore,
  });

  final _log = Logger('FirebaseAdapter');

  /// Finds a document by its ID in the Firestore collection.
  ///
  /// Returns an object of type `T` if found, or `null` if not found.
  ///
  /// Example:
  /// ```dart
  /// final user = await firebaseAdapter.findById<User>(1);
  /// ```
  @override
  Future<T?> findById<T>(int id) async {
    try {
      final doc = await firestore
          .collection(_getCollectionName<T>())
          .doc(id.toString())
          .get();
      if (doc.exists) {
        return _fromFirestore<T>(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      _log.warning('Error finding document by ID: $e');
    }
    return null;
  }

  /// Retrieves all documents from a Firestore collection.
  ///
  /// Returns a list of objects of type `T`, or `null` if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// final users = await firebaseAdapter.findAll<User>();
  /// ```
  @override
  Future<List<T>?> findAll<T>() async {
    try {
      final querySnapshot =
          await firestore.collection(_getCollectionName<T>()).get();

      return querySnapshot.docs
          .map((doc) => _fromFirestore<T>(doc.data()))
          .whereType<T>()
          .toList();
    } catch (e) {
      _log.warning('Error finding all documents: $e');
      return null;
    }
  }

  /// Creates a new document in the Firestore collection.
  ///
  /// If the object has an `id` field, it will be used as the document ID.
  /// Otherwise, Firestore will generate an ID automatically.
  ///
  /// Example:
  /// ```dart
  /// final user = {'id': 1, 'name': 'John Doe'};
  /// await firebaseAdapter.create(user);
  /// ```
  @override
  Future<void> create<T>(Map<String, dynamic> value) async {
    try {
      final collection = firestore.collection(_getCollectionName<T>());
      final data = _toFirestore(value);
      if (data.containsKey('id') && data['id'] != null) {
        await collection.doc(data['id'].toString()).set(data);
      } else {
        await collection.add(data);
      }
    } catch (e) {
      _log.warning('Error to creating document in $T collection: $e');
    }
  }

  /// Removes a document by its ID from the Firestore collection.
  ///
  /// Example:
  /// ```dart
  /// await firebaseAdapter.remove<User>(1);
  /// ```
  @override
  Future<void> remove<T>(int id) async {
    try {
      await firestore
          .collection(_getCollectionName<T>())
          .doc(id.toString())
          .delete();
    } catch (e) {
      _log.warning('Error removing document: $e');
    }
  }

  /// Clears all documents in a Firestore collection.
  ///
  /// Example:
  /// ```dart
  /// await firebaseAdapter.clear<User>();
  /// ```
  @override
  Future<void> clear<T>() async {
    try {
      final collection = firestore.collection(_getCollectionName<T>());
      final querySnapshot = await collection.get();
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      _log.warning('Error clearing collection: $e');
    }
  }

  /// Updates an existing document in the Firestore collection.
  ///
  /// The object must have an `id` field to identify the document.
  ///
  /// Throws an exception if the `id` field is missing.
  ///
  /// Example:
  /// ```dart
  /// final updatedUser = {'id': 1, 'name': 'John Updated'};
  /// await firebaseAdapter.update(updatedUser);
  /// ```
  @override
  Future<void> update<T>(T value) async {
    try {
      final data = _toFirestore(value);
      if (data.containsKey('id')) {
        await firestore
            .collection(_getCollectionName<T>())
            .doc(data['id'].toString())
            .update(data);
      } else {
        throw Exception('Document must have an "id" field to update');
      }
    } catch (e) {
      _log.warning('Error updating document: $e');
    }
  }

  // Helpers:

  /// Generates the collection name based on the type `T`.
  ///
  /// Example: For the type `User`, the collection name will be `users`.
  String _getCollectionName<T>() {
    return '${T.toString().toLowerCase()}s'; // Ex: "user" -> "users"
  }

  /// Converts a Firestore map into an object of type `T`.
  ///
  /// Throws an exception if the type `T` cannot be created from a map.
  Map<String, dynamic> _toFirestore<T>(T value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    throw Exception(
        'Cannot convert $T to Firestore format. Implement _toFirestore for $T.');
  }

  T? _fromFirestore<T>(Map<String, dynamic> data) {
    if (T == Map<String, dynamic>) {
      return data as T;
    }
    throw Exception(
        'Cannot convert Firestore data to $T. Implement _fromFirestore for $T.');
  }
}
