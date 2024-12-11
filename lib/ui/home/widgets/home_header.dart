import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Olá, Henrique.",
          style: TextStyle(
            color: Color(0xff8E8E93),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: Image.network(
                "https://github.com/hmartiins.png",
                width: 42,
                height: 42,
              ),
            )
          ],
        )
      ],
    );
  }
}
