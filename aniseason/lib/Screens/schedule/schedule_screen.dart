import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:aniseason/Widgets/weekly_anime_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Models/anime_model.dart';

class AnimeSchedule extends ConsumerStatefulWidget {
  const AnimeSchedule({super.key});

  @override
  ConsumerState<AnimeSchedule> createState() => _AnimeScheduleState();
}

class _AnimeScheduleState extends ConsumerState<AnimeSchedule> {
  late String currentDay;

  static const List<Text> days = [
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
    final dailyScheduledAnime = ref.watch(weeklyScheduleProvider);
    ref.watch(selectedDayProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Column(
          children: [
            const Text(
              "ANIME SCHEDULE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Divider(
              height: 30,
              color: AppColors.thirty,
              thickness: 1,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                padding: const EdgeInsets.all(2),
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return weeklyAnimeButton(context, indexToDay[index]!, ref);
                },
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: dailyScheduledAnime.when(
                data: (animeData) {
                  List<AnimeModel> animeList = animeData.map((e) => e).toList();
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenHeight * 0.3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return seasonalCard(context, animeList[index]);
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
