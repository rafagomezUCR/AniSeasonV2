import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Widgets/bottom_nav_bar.dart';
import 'package:aniseason/Widgets/scrollable_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:ui' as ui;

import '../Models/anime_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final topAnime = ref.watch(getTopAnimeProvider);
    final currentSeason = ref.watch(getCurrentSeasonProvider);
    final upcomingSeason = ref.watch(getUpcomingSeasonProvider);
    final season = ref.watch(getSeasonProvider(['2010', 'summer']));
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenHeight * 0.07, screenWidth * 0.05, 0),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              cursorColor: AppColors.darkText,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Search for Anime...",
                filled: true,
                fillColor: AppColors.sixty,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkText,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: CarouselSlider.builder(
                        itemCount: 5,
                        options: CarouselOptions(
                          height: screenHeight * 0.3,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 7),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return topAnime.when(
                            data: (animeData) {
                              List<AnimeModel> topAnimeList =
                                  animeData.map((e) => e).toList();
                              return GestureDetector(
                                onTap: () {
                                  context.push('/animeInfo');
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          topAnimeList[index].largeImageUrl),
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
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 200,
                        child: topAnime.when(
                          data: (animeData) {
                            List<AnimeModel> animeList =
                                animeData.map((e) => e).toList();
                            return ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10);
                              },
                              itemCount: animeList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ScrollableCard(
                                    context, animeList[index].largeImageUrl);
                              },
                            );
                          },
                          error: (err, stack) {
                            Center(child: Text(err.toString()));
                          },
                          loading: () {
                            const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 200,
                        child: currentSeason.when(
                          data: (animeData) {
                            List<AnimeModel> animeList =
                                animeData.map((e) => e).toList();
                            return ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10);
                              },
                              itemCount: animeList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ScrollableCard(
                                    context, animeList[index].largeImageUrl);
                              },
                            );
                          },
                          error: (err, stack) {
                            Center(child: Text(err.toString()));
                          },
                          loading: () {
                            const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 200,
                        child: upcomingSeason.when(
                          data: (animeData) {
                            List<AnimeModel> animeList =
                                animeData.map((e) => e).toList();
                            return ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10);
                              },
                              itemCount: animeList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ScrollableCard(
                                    context, animeList[index].largeImageUrl);
                              },
                            );
                          },
                          error: (err, stack) {
                            Center(child: Text(err.toString()));
                          },
                          loading: () {
                            const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
