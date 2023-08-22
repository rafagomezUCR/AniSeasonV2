import 'package:aniseason/Screens/schedule/ScheduleWidgets/schedule_weekly_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget scheduleWeeklyList(BuildContext context, WidgetRef ref) {
  const List<Text> days = [
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
  return ListView.separated(
    separatorBuilder: (context, index) {
      return const SizedBox(width: 10);
    },
    padding: const EdgeInsets.all(2),
    scrollDirection: Axis.horizontal,
    itemCount: days.length,
    itemBuilder: (context, index) {
      return scheduleWeeklyButtons(context, indexToDay[index]!, ref);
    },
  );
}
