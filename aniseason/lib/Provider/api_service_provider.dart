import 'package:aniseason/Models/anime_model.dart';
import 'package:aniseason/Services/jikan_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

final apiServiceProvider = Provider<JikanAPIService>(
  (ref) {
    return JikanAPIService();
  },
);

final getAnimeByIdProvider = FutureProvider.family.autoDispose<AnimeModel, int>(
  (ref, id) async {
    return ref.watch(apiServiceProvider).getAnimeById(id);
  },
);

final getTopAnimeProvider = FutureProvider.autoDispose<List<AnimeModel>>(
  (ref) {
    return ref.watch(apiServiceProvider).getTopAnime();
  },
);

final searchAnimeProvider =
    FutureProvider.family.autoDispose<List<AnimeModel>, String>(
  (ref, anime) {
    return ref.watch(apiServiceProvider).searchAnime(anime);
  },
);

final getCurrentSeasonProvider = FutureProvider.autoDispose<List<AnimeModel>>(
  (ref) {
    return ref.watch(apiServiceProvider).getCurrentSeason();
  },
);

final getUpcomingSeasonProvider = FutureProvider.autoDispose<List<AnimeModel>>(
  (ref) {
    return ref.watch(apiServiceProvider).getUpcomingSeason();
  },
);

final getScheduleProvider = FutureProvider.family<List<AnimeModel>, String>(
  (ref, day) {
    return ref.watch(apiServiceProvider).getSchedule(day);
  },
);

final getSeasonProvider =
    FutureProvider.family.autoDispose<List<AnimeModel>, Tuple2<String, String>>(
  (ref, date) {
    return ref.watch(apiServiceProvider).getSeason(date.item1, date.item2);
  },
);

final selectedSeasonProvider = StateProvider<String>(
  (ref) {
    return 'Spring';
  },
);

final selectedYearProvider = StateProvider<String>(
  (ref) {
    return '2020';
  },
);

final selectedDayProvider = StateProvider.autoDispose<String>((ref) {
  return DateFormat('EEEE').format(DateTime.now());
});

final animeSeasonProvider = Provider.autoDispose<AsyncValue<List<AnimeModel>>>(
  (ref) {
    final animeYear = ref.read(selectedYearProvider);
    final animeSeason = ref.read(selectedSeasonProvider);
    return ref.watch(getSeasonProvider(Tuple2(animeYear, animeSeason)));
  },
);

final weeklyScheduleProvider = Provider<AsyncValue<List<AnimeModel>>>(
  (ref) {
    final day = ref.read(selectedDayProvider);
    return ref.watch(getScheduleProvider(day));
  },
);
