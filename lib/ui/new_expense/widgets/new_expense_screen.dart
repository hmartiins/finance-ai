import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:finance_ai/ui/core/ui/page_container.dart';
import 'package:finance_ai/ui/new_expense/widgets/new_expense_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpenseScreen extends StatelessWidget {
  const NewExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.red100,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return PageContainer(
      backgroundColor: AppColors.red100,
      appBar: AppBar(
        title: Text(
          'Expense',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.red100,
        elevation: 0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          const NewExpenseBody(),
        ],
      ),
    );
  }
}
