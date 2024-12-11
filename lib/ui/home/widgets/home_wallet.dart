import 'package:flutter/material.dart';

class HomeWallet extends StatelessWidget {
  const HomeWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Histórico",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Ver mais",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff007AFF),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(99.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nike Air Max 90",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "15 Ago 2024",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E8E93),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              r"-R$ 249.99",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(99.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nike Air Max 90",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "15 Ago 2024",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E8E93),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              r"-R$ 249.99",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
