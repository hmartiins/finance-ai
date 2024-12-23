import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
  });

  final Widget child;

  final Color? backgroundColor;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: child,
    );
  }
}
