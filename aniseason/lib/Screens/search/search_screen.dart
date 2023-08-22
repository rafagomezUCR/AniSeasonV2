import 'package:aniseason/GeneralWidgets/back_button.dart';
import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Screens/search/SearchWidgets/search_anime_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchedAnime extends ConsumerWidget {
  const SearchedAnime({super.key, required this.searchedAnime});

  final String searchedAnime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anime = ref.watch(searchAnimeProvider(searchedAnime));
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: customBackButton(context),
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
            const SizedBox(height: 50),
            Flexible(
              child: searchAnimeListView(context, anime),
            ),
          ],
        ),
      ),
    );
  }
}
