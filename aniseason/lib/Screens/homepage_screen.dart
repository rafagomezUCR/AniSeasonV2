import 'package:aniseason/Widgets/bottom_nav_bar.dart';
import 'package:aniseason/Widgets/scrollable_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aniseason/Styles/appcolors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenHeight * 0.07, screenWidth * 0.05, 0),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              cursorColor: AppColors.darkText,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Search for Anime...",
                filled: true,
                fillColor: AppColors.sixty,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkText,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: screenHeight * 0.3,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 7),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                          enlargeCenterPage: true,
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'text $i',
                                    style: const TextStyle(fontSize: 16.0),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 200,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) =>
                              const ScrollableCard(),
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        height: 200,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) =>
                              const ScrollableCard(),
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        height: 200,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) =>
                              const ScrollableCard(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
