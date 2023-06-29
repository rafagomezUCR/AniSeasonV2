import 'dart:collection';

import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Widgets/tab_bar_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import '../Models/anime_model.dart';
import '../Styles/appcolors.dart';

class AnimeSchedule extends ConsumerStatefulWidget {
  const AnimeSchedule({super.key});

  @override
  ConsumerState createState() => _AnimeScheduleState();
}

class _AnimeScheduleState extends ConsumerState<AnimeSchedule>
    with TickerProviderStateMixin {
  late String _currentDay;
  late TabController tabController;
  late AsyncValue<List<AnimeModel>> animeSchedule;
  late AsyncValue<List<AnimeModel>> seasonTest;

  //ref.read(selectedYearProvider.notifier).state = value!

  @override
  void initState() {
    super.initState();
    _currentDay = DateFormat('EEEE').format(DateTime.now());
    tabController = TabController(length: 7, vsync: this);
    tabController.index = startingTabIndex[_currentDay]!;
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        animeSchedule = ref
            .refresh(getScheduleProvider(tabIndextoDay[tabController.index]!));
        if (tabController.index == 0) {
          print('what');
          seasonTest = ref.watch(getSeasonProvider(Tuple2('2010', 'summer')));
        }
        if (tabController.index == 1) {
          seasonTest = ref.refresh(getSeasonProvider(Tuple2('2015', 'summer')));
        }
        if (tabController.index == 2) {
          seasonTest = ref.refresh(getSeasonProvider(Tuple2('2020', 'spring')));
        }
        if (tabController.index == 3) {
        } else {
          seasonTest = ref.refresh(getSeasonProvider(Tuple2('2017', 'summer')));
        }
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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

  Map<int, String> tabIndextoDay = {
    0: 'Sunday',
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday'
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: startingTabIndex[_currentDay]!,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.ten,
          title: Text("SCHEDULE"),
          toolbarHeight: 50,
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            indicatorColor: AppColors.ten,
            tabs: [
              Tab(
                child: Text(
                  "S",
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
        body: TabBarView(controller: tabController, children: [
          AnimeTabBarView(context, ref, '2008', 'summer'),
          AnimeTabBarView(context, ref, '2010', 'spring'),
          AnimeTabBarView(context, ref, '2015', 'summer'),
          AnimeTabBarView(context, ref, '2018', 'summer'),
          AnimeTabBarView(context, ref, '2020', 'summer'),
          AnimeTabBarView(context, ref, '2020', 'summer'),
          AnimeTabBarView(context, ref, '2009', 'summer'),
        ]),
      ),
    );
  }
}
