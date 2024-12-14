import 'package:finance_ai/domain/expanse/expense_amount_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    int? id,
    required DateTime createdAt,
    required String title,
    required String category,
    required String wallet,
    required double amount,
    required ExpenseAmountDetails amountDetails,
  }) = _Expense;

  factory Expense.fromJson(Map<String, Object?> json) =>
      _$ExpenseFromJson(json);
}
