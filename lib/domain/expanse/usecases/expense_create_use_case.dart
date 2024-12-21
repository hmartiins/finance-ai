import 'package:finance_ai/data/repositories/expense/expense_repository.dart';
import 'package:finance_ai/domain/expanse/models/expense.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:logging/logging.dart';

class ExpenseCreateUseCase {
  ExpenseCreateUseCase({
    required ExpenseRepository expenseRepository,
  }) : _expenseRepository = expenseRepository;

  final ExpenseRepository _expenseRepository;

  final _log = Logger('ExpenseCreateUseCase');

  /// Create [Expense] from a stored [ItineraryConfig]
  Future<Result<Expense>> createFrom(Expense expense) async {
    final saveExpenseResult = await _expenseRepository.createExpense(expense);

    switch (saveExpenseResult) {
      case Ok<void>():
        _log.info('Expense saved successfully');
        break;
      case Error<void>():
        _log.warning('Failed to save expense', saveExpenseResult.error);
        return Result.error(saveExpenseResult.error);
    }

    return Result.ok(expense);
  }
}
