import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Screens/homepage/HomePageWidgets/homepage_anime_listview.dart';
import 'package:aniseason/Screens/homepage/HomePageWidgets/homepage_carousel_slider.dart';
import 'package:aniseason/Screens/homepage/HomePageWidgets/homepage_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            homepageTextField(context, searchController),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "TOP ANIME",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: homepageCarouselSlider(context, topAnime),
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
                      child: homepageListView(context, currentSeason),
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
