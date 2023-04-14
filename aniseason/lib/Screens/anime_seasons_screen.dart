import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AnimeSeasons extends StatefulWidget {
  AnimeSeasons({super.key});

  @override
  State<AnimeSeasons> createState() => _AnimeSeasonsState();
}

class _AnimeSeasonsState extends State<AnimeSeasons> {
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
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.ten),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return AppColors.thirty;
                    }
                    return null;
                  },
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
