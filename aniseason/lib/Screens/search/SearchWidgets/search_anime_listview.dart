import 'package:aniseason/Screens/seasons/SeasonsWidgets/seasons_anime_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Models/anime_model.dart';

Widget searchAnimeListView(
    BuildContext context, AsyncValue<List<AnimeModel>> anime) {
  final double screenHeight = MediaQuery.of(context).size.height;
  return anime.when(
    data: (animeData) {
      List<AnimeModel> animeList = animeData.map((e) => e).toList();
      return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: screenHeight * 0.3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return seasonsAnimeImageCard(context, animeList[index]);
        },
        itemCount: animeList.length,
      );
    },
    error: (err, stackTrace) {
      return Center(
        child: Text(err.toString()),
      );
    },
    loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
