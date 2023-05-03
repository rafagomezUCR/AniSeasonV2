import 'package:aniseason/Models/anime_model.dart';
import 'package:aniseason/Services/jikan_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<JikanAPIService>((ref) {
  return JikanAPIService();
});

final getAnimeByIdProvider =
    FutureProvider.family.autoDispose<AnimeModel, int>((ref, id) async {
  return ref.watch(apiServiceProvider).getAnimeById(id);
});

final getTopAnimeProvider = FutureProvider.autoDispose<List<AnimeModel>>((ref) {
  return ref.watch(apiServiceProvider).getTopAnime();
});

final searchAnimeProvider =
    FutureProvider.family.autoDispose<List<AnimeModel>, String>((ref, anime) {
  return ref.watch(apiServiceProvider).searchAnime(anime);
});

final getCurrentSeasonProvider =
    FutureProvider.autoDispose<List<AnimeModel>>((ref) {
  return ref.watch(apiServiceProvider).getCurrentSeason();
});

final getUpcomingSeasonProvider =
    FutureProvider.autoDispose<List<AnimeModel>>((ref) {
  return ref.watch(apiServiceProvider).getUpcomingSeason();
});

final getScheduleProvider =
    FutureProvider.family.autoDispose<List<AnimeModel>, String>((ref, day) {
  return ref.watch(apiServiceProvider).getSchedule(day);
});

final getSeasonProvider = FutureProvider.family
    .autoDispose<List<AnimeModel>, List<String>>((ref, date) {
  return ref.watch(apiServiceProvider).getSeason(date[0], date[1]);
});
