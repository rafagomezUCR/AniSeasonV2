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
  final List<String> seasonlist = ['Spring', 'Summer', 'Fall', 'Winter'];

  String? selectedSeason;

  List<DropdownMenuItem<String>> _DividedMenuItemList(List<String> items) {
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

  List<double> _customMenuItemHeights() {
    List<double> itemHeights = [];
    for (var i = 0; i < (seasonlist.length * 2) - 1; ++i) {
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
                    // changes backgroundcolor when picking item
                    //barrierColor: AppColors.ten,
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
                    customItemsHeights: _customMenuItemHeights(),
                    onChanged: (value) => {},
                    items: _DividedMenuItemList(seasonlist),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                      // changes backgroundcolor when picking item
                      //barrierColor: AppColors.ten,
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.lightText),
                        color: AppColors.ten,
                      ),
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
                      customItemsHeights: _customMenuItemHeights(),
                      onChanged: (value) => {},
                      items: _DividedMenuItemList(seasonlist)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(onPressed: () {}, child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
