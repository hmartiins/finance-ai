import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_ai/adapters/storage/firebase/firebase_adapter.dart';
import 'package:finance_ai/adapters/storage/storage_adapter.dart';
import 'package:finance_ai/data/services/openai_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
  Provider(
    create: (context) => OpenAIService(),
  ),
  Provider<IStorageAdapter>(
    create: (context) => FirebaseAdapter(
      firestore: FirebaseFirestore.instance,
    ),
  ),
];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> get providersRemote {
  return [
    ..._sharedProviders,
  ];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
/// The user is always logged in.
List<SingleChildWidget> get providersLocal {
  return [
    ..._sharedProviders,
  ];
}
