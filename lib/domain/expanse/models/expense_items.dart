import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_items.freezed.dart';
part 'expense_items.g.dart';

@freezed
class ExpenseItems with _$ExpenseItems {
  @JsonSerializable(explicitToJson: true)
  const factory ExpenseItems({
    required String name,
    required double price,
  }) = _ExpenseItems;

  factory ExpenseItems.fromJson(Map<String, Object?> json) =>
      _$ExpenseItemsFromJson(json);
}
