import 'dart:convert';

import 'package:http/http.dart';

class JikanAPIService {
  String endpoint = 'https://api.jikan.moe/v4/';

  Future<List<String>> getTopAnime() async {
    Response res = await get(Uri.parse('${endpoint}top/anime'));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body);
      return result.map((e) => ['a']).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
