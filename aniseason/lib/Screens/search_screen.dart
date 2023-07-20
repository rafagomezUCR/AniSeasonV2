import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../Models/anime_model.dart';
import '../Styles/appcolors.dart';

class SearchedAnime extends ConsumerWidget {
  const SearchedAnime({super.key, required this.searchedAnime});

  final String searchedAnime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anime = ref.watch(searchAnimeProvider(searchedAnime));
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColors.thirty;
                          } else {
                            return AppColors.ten;
                          }
                        },
                      ),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  child: Text(
                    searchedAnime,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: anime.when(
                data: (animeData) {
                  List<AnimeModel> animeList = animeData.map((e) => e).toList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenHeight * 0.3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return SeasonalCard(context, animeList[index]);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
