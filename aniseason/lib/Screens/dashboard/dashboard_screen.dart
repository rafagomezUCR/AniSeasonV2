import 'package:aniseason/Screens/dashboard/DashBoardWidgets/dashboard_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  final Widget child;
  const DashBoard({super.key, required this.child});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
