import 'package:finance_ai/ui/core/ui/add_attachment.dart';
import 'package:finance_ai/ui/core/ui/dropdown.dart';
import 'package:finance_ai/ui/core/ui/image_attachment.dart';
import 'package:finance_ai/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewExpenseBody extends StatefulWidget {
  const NewExpenseBody({
    super.key,
    required this.viewModel,
  });

  final NewExpenseViewModel viewModel;

  @override
  State<NewExpenseBody> createState() => _NewExpenseBodyState();
}

class _NewExpenseBodyState extends State<NewExpenseBody> {
  final TextEditingController _category =
      TextEditingController(text: "Category");
  final TextEditingController _description = TextEditingController();
  final TextEditingController _wallet = TextEditingController(text: "Wallet");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dropdown(
              selectedValue: _category.value.text,
              options: const ["Category", "Food", "Clothes"],
              onChanged: (value) {
                setState(() {
                  _category.value = TextEditingValue(text: value!);
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              style: Theme.of(context).textTheme.bodyMedium,
              controller: _description,
            ),
            const SizedBox(height: 16),
            Dropdown(
              selectedValue: _wallet.value.text,
              options: const ["Wallet", "Nubank", "Paypal", "Itaú"],
              onChanged: (value) {
                setState(() {
                  _wallet.value = TextEditingValue(text: value!);
                });
              },
            ),
            const SizedBox(height: 16),
            widget.viewModel.image == null
                ? AddAttachment(
                    onTap: () {
                      widget.viewModel.getImage.execute(ImageSource.gallery);
                    },
                  )
                : ImageAttachment(
                    image: widget.viewModel.image!,
                    onTap: widget.viewModel.removeImage,
                  ),
            const SizedBox(height: 16),
            SizedBox(
              width: size.width,
              child: FilledButton(
                onPressed: () async {
                  await widget.viewModel.processImageToText.execute();
                  await widget.viewModel.transformRecognizedTextToJsonByAI
                      .execute();
                  await widget.viewModel.createExpense.execute((
                    _description.value.text,
                    _category.value.text,
                    _wallet.value.text,
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Continue",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
