import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../Models/anime_model.dart';

Widget homepageCarouselSlider(
    BuildContext context, AsyncValue<List<AnimeModel>> topAnime) {
  final double screenHeight = MediaQuery.of(context).size.height;
  return CarouselSlider.builder(
    itemCount: 5,
    options: CarouselOptions(
      height: screenHeight * 0.3,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 7),
      autoPlayAnimationDuration: const Duration(milliseconds: 500),
      enlargeCenterPage: true,
    ),
    itemBuilder: (context, index, realIndex) {
      return topAnime.when(
        data: (animeData) {
          List<AnimeModel> topAnimeList = animeData.map((e) => e).toList();
          return GestureDetector(
            onTap: () {
              context.push('/animeInfo', extra: topAnimeList[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(topAnimeList[index].largeImageUrl),
                ),
              ),
            ),
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
    },
  );
}
