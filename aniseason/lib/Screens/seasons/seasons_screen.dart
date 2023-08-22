import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Screens/seasons/SeasonsWidgets/seasons_anime_list.dart';
import 'package:aniseason/Screens/seasons/SeasonsWidgets/seasons_submit_button.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'SeasonsWidgets/seasons_dropdown_menu.dart';

class AnimeSeasons extends ConsumerWidget {
  AnimeSeasons({super.key});

  final List<String> _seasonList = ['Spring', 'Summer', 'Fall', 'Winter'];
  final List<String> _yearsList = List.generate(
    DateTime.now().year - 1980 + 1,
    (index) => (DateTime.now().year - index).toString(),
  );

  @override
  Widget build(BuildContext context, ref) {
    String selectedSeason = ref.watch(selectedSeasonProvider);
    String selectedYear = ref.watch(selectedYearProvider);
    final selectedSeasonYear = ref.watch(animeSeasonProvider);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Text(
              "ANIME SEASONS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Divider(
              height: 30,
              color: AppColors.thirty,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                seasonsDropDownMenu(
                    context, ref, selectedSeason, _seasonList, 'season'),
                seasonsDropDownMenu(
                    context, ref, selectedYear, _yearsList, 'year')
              ],
            ),
            const SizedBox(height: 20),
            seasonsSubmitButton(context, ref),
            const SizedBox(height: 20),
            Flexible(
              child: seasonsAnimeList(context, selectedSeasonYear),
            ),
          ],
        ),
      ),
    );
  }
}
