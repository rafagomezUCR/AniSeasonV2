import 'dart:math';

import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/anime_model.dart';

class AnimeSeasons extends ConsumerWidget {
  AnimeSeasons({super.key});
  final List<String> _seasonList = ['Spring', 'Summer', 'Fall', 'Winter'];
  final List<String> _yearsList = List.generate(
    DateTime.now().year - 1980 + 1,
    (index) => (DateTime.now().year - index).toString(),
  );

  String? selectedSeason;

  List<DropdownMenuItem<String>> _dividedMenuItemList(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ),
          if (item != items.last)
            DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                color: AppColors.ten,
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
    double screenWidth = MediaQuery.of(context).size.width;
    //final animeSeason = ref.watch(getSeasonProvider(['summer', '2010']));
    final currentSeason = ref.watch(getCurrentSeasonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ANIME SEASONS"),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: AppColors.ten,
      ),
      body: Container(
        margin:
            EdgeInsets.fromLTRB(screenWidth * 0.05, 10, screenWidth * 0.05, 0),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.lightText),
                      color: AppColors.ten,
                    ),
                    iconEnabledColor: Colors.white,
                    hint: const Text(
                      "Select Season",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    customItemsHeights: _customMenuItemHeights(_seasonList),
                    onChanged: (value) => {},
                    items: _dividedMenuItemList(_seasonList),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.lightText),
                      color: AppColors.ten,
                    ),
                    dropdownMaxHeight: 200,
                    iconEnabledColor: Colors.white,
                    hint: const Text(
                      "Select Year",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    customItemsHeights: _customMenuItemHeights(_yearsList),
                    onChanged: (value) => {},
                    items: _dividedMenuItemList(_yearsList),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.ten,
                foregroundColor: Colors.black,
                padding: EdgeInsets.all(15),
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
              child: currentSeason.when(
                data: (animeData) {
                  List<AnimeModel> animeSeason =
                      animeData.map((e) => e).toList();
                  return GridView.builder(
                    itemCount: animeData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenHeight * 0.3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return SeasonalCard(
                          context, animeSeason[index].largeImageUrl);
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
