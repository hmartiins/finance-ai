import 'package:finance_ai/ui/core/ui/add_attachment.dart';
import 'package:finance_ai/ui/core/ui/dropdown.dart';
import 'package:finance_ai/ui/core/ui/image_attachment.dart';
import 'package:finance_ai/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewExpenseBody extends StatelessWidget {
  const NewExpenseBody({
    super.key,
    required this.viewModel,
  });

  final NewExpenseViewModel viewModel;

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
              selectedValue: "Category",
              options: const ["Category", "Food", "Clothes"],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Dropdown(
              selectedValue: "Nubank",
              options: const ["Nubank", "Paypal", "Itaú"],
            ),
            const SizedBox(height: 16),
            viewModel.image == null
                ? AddAttachment(
                    onTap: () {
                      viewModel.getImage.execute(ImageSource.gallery);
                    },
                  )
                : ImageAttachment(
                    image: viewModel.image!,
                    onTap: viewModel.removeImage,
                  ),
            const SizedBox(height: 16),
            SizedBox(
              width: size.width,
              child: FilledButton(
                onPressed: () async {
                  await viewModel.processImageToText.execute();
                  await viewModel.transformRecognizedTextToJsonByAI.execute();
                  await viewModel.createExpense.execute();
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
