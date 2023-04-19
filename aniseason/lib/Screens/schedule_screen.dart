import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../Styles/appcolors.dart';

class AnimeSchedule extends StatefulWidget {
  AnimeSchedule({super.key});

  @override
  State<AnimeSchedule> createState() => _AnimeScheduleState();
}

class _AnimeScheduleState extends State<AnimeSchedule> {
  late String _currentDay;

  @override
  void initState() {
    super.initState();
    _currentDay = DateFormat('EEEE').format(DateTime.now());
  }

  Map<String, int> startingTabIndex = {
    "Sunday": 0,
    "Monday": 1,
    "Tuesday": 2,
    "Wednesday": 3,
    "Thursday": 4,
    "Friday": 5,
    "Saturday": 6
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: startingTabIndex[_currentDay] ?? 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.ten,
          title: Text("SCHEDULE"),
          toolbarHeight: 50,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.ten,
            tabs: [
              Tab(
                child: Text(
                  "S",
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
              Tab(
                child: Text(
                  "M",
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
              Tab(
                child: Text(
                  "T",
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
              Tab(
                child: Text(
                  "W",
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
              Tab(
                child: Text(
                  "T",
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
              Tab(
                child: Text(
                  "F",
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
              Tab(
                child: Text(
                  "S",
                  style: TextStyle(color: AppColors.lightText),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("1"),
            ),
          ],
        ),
      ),
    );
  }
}
