import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Models/anime_model.dart';

class AnimeSeasons extends ConsumerWidget {
  AnimeSeasons({super.key});
  final List<String> _seasonList = ['Spring', 'Summer', 'Fall', 'Winter'];
  final List<String> _yearsList = List.generate(
    DateTime.now().year - 1980 + 1,
    (index) => (DateTime.now().year - index).toString(),
  );

  List<DropdownMenuItem<String>> _dividedMenuItemList(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                color: Colors.black,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _customMenuItemHeights(List<String> items) {
    List<double> itemHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; ++i) {
      if (i % 2 == 0) {
        itemHeights.add(40);
      } else {
        itemHeights.add(4);
      }
    }
    return itemHeights;
  }

  @override
  Widget build(BuildContext context, ref) {
    double screenHeight = MediaQuery.of(context).size.height;
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.thirty,
                    ),
                    value: selectedSeason,
                    iconEnabledColor: Colors.white,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.thirty,
                    ),
                    customItemsHeights: _customMenuItemHeights(_seasonList),
                    onChanged: (value) => {
                      ref.read(selectedSeasonProvider.notifier).state = value!
                    },
                    items: _dividedMenuItemList(_seasonList),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.thirty,
                    ),
                    value: selectedYear,
                    dropdownMaxHeight: 200,
                    iconEnabledColor: Colors.white,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.thirty,
                    ),
                    customItemsHeights: _customMenuItemHeights(_yearsList),
                    onChanged: (value) => {
                      ref.read(selectedYearProvider.notifier).state = value!
                    },
                    items: _dividedMenuItemList(_yearsList),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(animeSeasonProvider);
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.thirty,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: selectedSeasonYear.when(
                data: (animeData) {
                  List<AnimeModel> animeSeason =
                      animeData.map((e) => e).toList();
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
                      return seasonalCard(context, animeSeason[index]);
                    },
                  );
                },
                error: (err, stack) {
                  return Center(child: Text(err.toString()));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
