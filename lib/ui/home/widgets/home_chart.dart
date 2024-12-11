import 'package:finance_ai/ui/home/widgets/chart.dart';
import 'package:flutter/material.dart';

class HomeChart extends StatelessWidget {
  const HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffecdbf8),
            Color(0xffe5c7f4),
            Color(0xffecdbf8),
          ],
        ),
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Despesas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 200, child: Chart()),
        ],
      ),
    );
  }
}
