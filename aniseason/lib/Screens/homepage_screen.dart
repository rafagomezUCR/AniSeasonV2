import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Routes/named_routes.dart';
import 'package:aniseason/Widgets/bottom_nav_bar.dart';
import 'package:aniseason/Widgets/scrollable_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tuple/tuple.dart';
import 'dart:ui' as ui;

import '../Models/anime_model.dart';
import '../Widgets/anime_info_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final topAnime = ref.watch(getTopAnimeProvider);
    final currentSeason = ref.watch(getCurrentSeasonProvider);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenHeight * 0.07, screenWidth * 0.05, 0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                context.push('/searchedAnime', extra: value);
              },
              controller: searchController,
              autocorrect: false,
              cursorColor: AppColors.ten,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search for Anime...",
                hintStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: AppColors.thirty,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.ten,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  const Text("TOP ANIME"),
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
                                context.push('/animeInfo',
                                    extra: topAnimeList[index]);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
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
                    padding: const EdgeInsets.fromLTRB(10, 30, 0, 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Current Season",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: currentSeason.when(
                        data: (animeData) {
                          List<AnimeModel> animeList =
                              animeData.map((e) => e).toList();
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
                                  scrollableCard(context, animeList[index]),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 150,
                                    width: screenWidth * 0.5,
                                    child: animeInfoCard(
                                        context, animeList[index]),
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
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
