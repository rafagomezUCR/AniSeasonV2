import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget weeklyAnimeButton(BuildContext context, String day, WidgetRef ref) {
  return ElevatedButton(
    onPressed: () async {
      ref.read(selectedDayProvider.notifier).update((state) => day);
      ref.invalidate(weeklyScheduleProvider);
    },
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(2),
      shadowColor: MaterialStateProperty.all(AppColors.ten),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (ref.read(selectedDayProvider) == day) {
          return AppColors.thirty.withOpacity(0.5);
        }
        return AppColors.thirty;
      }),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size.fromWidth(130),
      ),
    ),
    child: Text(
      day.toUpperCase(),
      style: const TextStyle(color: Colors.white),
    ),
  );
}
