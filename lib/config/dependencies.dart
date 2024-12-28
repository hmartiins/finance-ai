import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_ai/adapters/auth/firebase_auth/firebase_auth.dart';
import 'package:finance_ai/adapters/auth/storage_adapter.dart';
import 'package:finance_ai/adapters/generative_ai/generative_ai_adapter.dart';
import 'package:finance_ai/adapters/generative_ai/open_ai/open_ai_local_adapter.dart';
import 'package:finance_ai/adapters/generative_ai/open_ai/open_ai_remote_adapter.dart';
import 'package:finance_ai/adapters/storage/firebase/firebase_adapter.dart';
import 'package:finance_ai/adapters/storage/storage_adapter.dart';
import 'package:finance_ai/config/open_ai_options.dart';
import 'package:finance_ai/data/repositories/expense/expense_repository.dart';
import 'package:finance_ai/data/repositories/expense/expense_repository_remote.dart';
import 'package:finance_ai/domain/expanse/usecases/expense_create_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
  Provider(
    create: (context) => ExpenseCreateUseCase(
      expenseRepository: context.read(),
    ),
  )
];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> get providersRemote {
  return [
    Provider<IGenerativeAIAdapter>(
      create: (context) => OpenAIRemoteAdapter(
        openAIInstance: OpenAiOptions.openAiInstance,
      ),
    ),
    Provider<IStorageAdapter>(
      create: (context) => FirebaseAdapter(
        firestore: FirebaseFirestore.instance,
      ),
    ),
    Provider<IAuthAdapter>(
      create: (context) => FirebaseAuthAdapter(
        firebaseAuth: FirebaseAuth.instance,
      ),
    ),
    Provider(
      create: (context) => ExpenseRepositoryRemote(
        storage: context.read<IStorageAdapter>(),
      ) as ExpenseRepository,
    ),
    ..._sharedProviders,
  ];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
/// The user is always logged in.
List<SingleChildWidget> get providersLocal {
  return [
    Provider<IGenerativeAIAdapter>(
      create: (context) => OpenAILocalAdapter(),
    ),
    Provider<IStorageAdapter>(
      create: (context) => FirebaseAdapter(
        firestore: FirebaseFirestore.instance,
      ),
    ),
    Provider<IAuthAdapter>(
      create: (context) => FirebaseAuthAdapter(
        firebaseAuth: FirebaseAuth.instance,
      ),
    ),
    Provider(
      create: (context) => ExpenseRepositoryRemote(
        storage: context.read<IStorageAdapter>(),
      ) as ExpenseRepository,
    ),
    ..._sharedProviders,
  ];
}
