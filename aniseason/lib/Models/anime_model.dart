class AnimeModel {
  final int malId;
  final String url;
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;
  final String trailerUrl;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  final String airedFrom;
  final String airedTo;
  final String duration;
  final String rating;
  final double score;
  final int scoredBy;
  final int rank;
  final String synopsis;
  final String season;
  final int year;
  final List<Map<String, String>> streaming;

  AnimeModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
    required this.trailerUrl,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.airedFrom,
    required this.airedTo,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.synopsis,
    required this.season,
    required this.year,
    required this.streaming,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'],
      url: json['url'],
      imageUrl: json['images']['jpg']['image_url'],
      smallImageUrl: json['images']['jpg']['small_image_url'],
      largeImageUrl: json['images']['jpg']['large_image_url'],
      trailerUrl: json['trailer']['url'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      type: json['type'],
      source: json['source'],
      episodes: json['episode'],
      status: json['status'],
      airing: json['airing'],
      airedFrom: json['aired']['from'],
      airedTo: json['aired']['to'],
      duration: json['duration'],
      rating: json['rating'],
      score: json['score'],
      scoredBy: json['scored_by'],
      rank: json['rank'],
      synopsis: json['synopsis'],
      season: json['season'],
      year: json['year'],
      streaming: json['streaming'],
    );
  }
}
