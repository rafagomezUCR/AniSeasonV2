import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:aniseason/Widgets/weekly_anime_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import '../Models/anime_model.dart';

class AnimeSchedule extends ConsumerStatefulWidget {
  const AnimeSchedule({super.key});

  @override
  ConsumerState<AnimeSchedule> createState() => _AnimeScheduleState();
}

class _AnimeScheduleState extends ConsumerState<AnimeSchedule> {
  late String currentDay;

  List<Text> days = [
    Text('sunday'),
    Text('monday'),
    Text('tuesday'),
    Text('wednesday'),
    Text('thursday'),
    Text('friday'),
    Text('saturday')
  ];

  Map<int, String> indexToDay = {
    0: 'sunday',
    1: 'monday',
    2: 'tuesday',
    3: 'wednesday',
    4: 'thursday',
    5: 'friday',
    6: 'saturday',
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //final day = ref.watch(selectedDayProvider);
    final dailyScheduledAnime = ref.watch(weeklyScheduleProvider);
    //var test = ref.watch(getSeasonProvider(Tuple2('2020', 'summer')));
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANIME SCHEDULE"),
        backgroundColor: AppColors.ten,
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 5);
                },
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return WeeklyAnimeButton(context, indexToDay[index]!, ref);
                },
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: dailyScheduledAnime.when(
                data: (animeData) {
                  List<AnimeModel> animeList = animeData.map((e) => e).toList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenHeight * 0.3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return SeasonalCard(context, animeList[index]);
                    },
                    itemCount: animeList.length,
                  );
                },
                error: (err, stackTrace) {
                  return Center(
                    child: Text(err.toString()),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
