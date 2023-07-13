import 'package:aniseason/Models/schedule_model.dart';
import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Screens/schedule_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWeeklyScheduleProvider = FutureProvider<AnimeScheduleModel>(
  (ref) async {
    final sundaySchedule =
        await ref.watch(getScheduleProvider('sunday').future);
    final mondaySchedule =
        await ref.watch(getScheduleProvider('monday').future);
    final tuesdaySchedule =
        await ref.watch(getScheduleProvider('tuesday').future);
    final wednesdaySchedule =
        await ref.watch(getScheduleProvider('wednesday').future);
    final thursdaySchedule =
        await ref.watch(getScheduleProvider('thursday').future);
    final fridaySchedule =
        await ref.watch(getScheduleProvider('friday').future);
    final saturdaySchedule =
        await ref.watch(getScheduleProvider('saturday').future);

    return AnimeScheduleModel(
        sunday: sundaySchedule,
        monday: mondaySchedule,
        tuesday: tuesdaySchedule,
        wednesday: wednesdaySchedule,
        thursday: thursdaySchedule,
        friday: fridaySchedule,
        saturday: saturdaySchedule);
  },
);
