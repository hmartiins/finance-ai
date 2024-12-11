import 'package:finance_ai/routing/routes.dart';
import 'package:finance_ai/ui/home/view_models/home_viewmodel.dart';
import 'package:finance_ai/ui/home/widgets/home_balance.dart';
import 'package:finance_ai/ui/home/widgets/home_chart.dart';
import 'package:finance_ai/ui/home/widgets/home_header.dart';
import 'package:finance_ai/ui/home/widgets/home_wallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.push(Routes.newExpanse);
                },
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              body: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    HomeHeader(),
                    SizedBox(height: 16),
                    HomeBalance(),
                    SizedBox(height: 16),
                    HomeChart(),
                    SizedBox(height: 16),
                    HomeWallet(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
