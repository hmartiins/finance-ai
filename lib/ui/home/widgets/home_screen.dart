import 'package:finance_ai/ui/home/widgets/home_balance.dart';
import 'package:finance_ai/ui/home/widgets/home_chart.dart';
import 'package:finance_ai/ui/home/widgets/home_header.dart';
import 'package:finance_ai/ui/home/widgets/home_wallet.dart';
import 'package:finance_ai/ui/home/widgets/vision_detector_views/text_detector_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(18.0),
              ),
            ),
            builder: (context) => const FractionallySizedBox(
              heightFactor: 0.9,
              child: TextRecognizerView(),
            ),
          );
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
      body: const SafeArea(
        top: true,
        bottom: true,
        child: Padding(
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
      ),
    );
  }
}
