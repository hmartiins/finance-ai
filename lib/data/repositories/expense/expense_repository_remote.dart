import 'package:finance_ai/adapters/storage/storage_adapter.dart';
import 'package:finance_ai/data/repositories/expense/expense_repository.dart';
import 'package:finance_ai/domain/expanse/models/expense.dart';
import 'package:finance_ai/utils/result.dart';

class ExpenseRepositoryRemote implements ExpenseRepository {
  final IStorageAdapter _storage;

  ExpenseRepositoryRemote({
    required IStorageAdapter storage,
  }) : _storage = storage;

  @override
  Future<Result<void>> createExpense(Expense expense) async {
    try {
      final result = await _storage.create<Expense>(expense.toJson());
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
