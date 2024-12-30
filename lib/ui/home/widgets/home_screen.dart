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
    final size = MediaQuery.of(context).size;

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
              body: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.31,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFF6E5), Color(0xFFF8EDD8)],
                          stops: [0, 0.99],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            HomeHeader(),
                            SizedBox(height: 16),
                            HomeBalance(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        HomeChart(),
                        SizedBox(height: 16),
                        HomeWallet(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
