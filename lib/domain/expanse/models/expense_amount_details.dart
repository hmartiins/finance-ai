import 'package:finance_ai/domain/expanse/models/expense_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_amount_details.freezed.dart';
part 'expense_amount_details.g.dart';

@freezed
class ExpenseAmountDetails with _$ExpenseAmountDetails {
  @JsonSerializable(explicitToJson: true)
  const factory ExpenseAmountDetails({
    required List<ExpenseItems> items,
    required double total,
  }) = _ExpenseAmountDetails;

  factory ExpenseAmountDetails.fromJson(Map<String, Object?> json) =>
      _$ExpenseAmountDetailsFromJson(json);
}
