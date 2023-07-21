import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/anime_model.dart';

Widget WeeklyAnimeButton(BuildContext context, String day, WidgetRef ref) {
  return ElevatedButton(
    onPressed: () {
      ref.read(selectedDayProvider.notifier).state = day;
      ref.invalidate(weeklyScheduleProvider);
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.ten),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          side: BorderSide(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      fixedSize: MaterialStateProperty.all(const Size.fromWidth(110)),
    ),
    child: Text(day),
  );
}