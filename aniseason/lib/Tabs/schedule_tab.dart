import 'package:flutter/material.dart';
import '../Styles/appcolors.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  @override
  Widget build(BuildContext context) {
    return const Tab(
      child: Text(
        "W",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
