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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          screenWidth * 0.05, screenHeight * 0.07, screenWidth * 0.05, 0),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // changes backgroundcolor when picking item
                  barrierColor: AppColors.ten,
                  buttonDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  hint: const Text("Select Season"),
                  onChanged: (value) => {},
                  items: seasonlist
                      .map<DropdownMenuItem<String>>(
                        (String item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // changes backgroundcolor when picking item
                  barrierColor: AppColors.ten,
                  hint: const Text("Select Year"),
                  onChanged: (value) => {},
                  items: seasonlist
                      .map<DropdownMenuItem<String>>(
                        (String item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(onPressed: () {}, child: Text('Submit')),
        ],
      ),
    );
  }
}
