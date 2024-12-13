import 'package:finance_ai/ui/core/ui/add_attachment.dart';
import 'package:finance_ai/ui/core/ui/dropdown.dart';
import 'package:flutter/material.dart';

class NewExpenseBody extends StatelessWidget {
  const NewExpenseBody({super.key});

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
            const AddAttachment(),
            const SizedBox(height: 16),
            SizedBox(
              width: size.width,
              child: FilledButton(
                onPressed: () {},
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
