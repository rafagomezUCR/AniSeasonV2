import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Styles/appcolors.dart';

class AnimeSchedule extends StatelessWidget {
  const AnimeSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
