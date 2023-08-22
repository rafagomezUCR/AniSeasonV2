import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Screens/schedule/ScheduleWidgets/schedule_anime_listview.dart';
import 'package:aniseason/Screens/schedule/ScheduleWidgets/schedule_weekly_listview.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeSchedule extends ConsumerStatefulWidget {
  const AnimeSchedule({super.key});

  @override
  ConsumerState<AnimeSchedule> createState() => _AnimeScheduleState();
}

class _AnimeScheduleState extends ConsumerState<AnimeSchedule> {
  @override
  Widget build(BuildContext context) {
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
              child: scheduleWeeklyList(context, ref),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: scheduleAnimeListView(context, dailyScheduledAnime),
            ),
          ],
        ),
      ),
    );
  }
}
