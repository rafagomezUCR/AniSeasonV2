import 'package:aniseason/Screens/seasons/SeasonsWidgets/seasons_anime_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Models/anime_model.dart';

Widget seasonsAnimeList(
    BuildContext context, AsyncValue<List<AnimeModel>> selectedSeasonYear) {
  final double screenHeight = MediaQuery.of(context).size.height;
  return selectedSeasonYear.when(
    data: (animeData) {
      List<AnimeModel> animeSeason = animeData.map((e) => e).toList();
      return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: animeData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: screenHeight * 0.3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return seasonsAnimeImageCard(context, animeSeason[index]);
        },
      );
    },
    error: (err, stack) {
      return Center(child: Text(err.toString()));
    },
    loading: () {
      return const Center(child: CircularProgressIndicator());
    },
  );
}
