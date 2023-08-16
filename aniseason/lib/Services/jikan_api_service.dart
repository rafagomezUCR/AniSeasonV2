import 'dart:convert';

import 'package:aniseason/Models/anime_model.dart';
import 'package:http/http.dart';

class JikanAPIService {
  String endpoint = 'https://api.jikan.moe/v4/';

  Future<AnimeModel> getAnimeById(int id) async {
    Response response = await get(Uri.parse('${endpoint}anime/$id/full'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];
      return AnimeModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<AnimeModel>> searchAnime(String anime) async {
    Response response = await get(Uri.parse('${endpoint}anime?q=$anime&sfw'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<AnimeModel>> getTopAnime() async {
    Response response = await get(Uri.parse('${endpoint}top/anime'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<AnimeModel>> getCurrentSeason() async {
    Response response = await get(Uri.parse('${endpoint}seasons/now'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<AnimeModel>> getUpcomingSeason() async {
    Response response = await get(Uri.parse('${endpoint}seasons/upcoming'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<AnimeModel>> getSchedule(String day) async {
    Response response =
        await get(Uri.parse('${endpoint}schedules?filter=$day&sfw=true'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<AnimeModel>> getSeason(String year, String season) async {
    Response response =
        await get(Uri.parse('${endpoint}seasons/$year/$season'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => AnimeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
