import 'package:finance_ai/domain/expanse/models/expense.dart';
import 'package:finance_ai/utils/result.dart';

abstract class ExpenseRepository {
  /// Creates a new [Expense].
  Future<Result<void>> createExpense(Expense booking);
}
