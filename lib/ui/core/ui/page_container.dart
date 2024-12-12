import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
