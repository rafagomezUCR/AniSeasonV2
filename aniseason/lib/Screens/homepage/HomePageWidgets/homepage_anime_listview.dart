import 'package:aniseason/Screens/homepage/HomePageWidgets/homepage_anime_listview_image.dart';
import 'package:aniseason/Screens/homepage/HomePageWidgets/homepage_anime_listview_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Models/anime_model.dart';

Widget homepageListView(
    BuildContext context, AsyncValue<List<AnimeModel>> currentSeason) {
  final double screenWidth = MediaQuery.of(context).size.width;
  return currentSeason.when(
    data: (animeData) {
      List<AnimeModel> animeList = animeData.map((e) => e).toList();
      return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: animeList.length,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            children: [
              homepageAnimeImageCard(context, animeList[index]),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 150,
                width: screenWidth * 0.5,
                child: homepageAnimeInfoCard(context, animeList[index]),
              ),
            ],
          );
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
