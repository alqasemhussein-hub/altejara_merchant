import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({
    Key? key,
    required this.child,
    this.bottomWidget,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);
  final Widget child;
  final Widget? bottomWidget;
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: child,
      bottomNavigationBar: bottomWidget,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
