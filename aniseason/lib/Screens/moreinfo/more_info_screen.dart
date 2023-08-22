import 'package:aniseason/Styles/appcolors.dart';
import 'package:aniseason/Screens/moreinfo/MoreInfoWidgets/more_info_imagecard.dart';
import 'package:flutter/material.dart';

import '../../GeneralWidgets/back_button.dart';
import '../../Models/anime_model.dart';

class AnimeInfo extends StatelessWidget {
  const AnimeInfo({super.key, required this.anime});

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: customBackButton(context),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Anime Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        moreInfoImageCard(context, anime),
                        Column(
                          children: [
                            Container(
                              height: 90,
                              width: 120,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.sixty,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Icons.stars_rounded,
                                      color: AppColors.thirty,
                                      size: 30,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(anime.score == 0.0
                                        ? 'N/A'
                                        : '${anime.score} / 10'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 90,
                              width: 120,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.sixty,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      anime.type == 'TV'
                                          ? Icons.ac_unit
                                          : Icons.calendar_month,
                                      color: AppColors.thirty,
                                      size: 30,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(anime.type == 'TV'
                                        ? '${anime.year} ${anime.season}'
                                        : anime.aired),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 90,
                              width: 120,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.sixty,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Icons.access_time,
                                      color: AppColors.thirty,
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(anime.type),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(anime.type == 'TV'
                                        ? '${anime.episodes} Episodes'
                                        : anime.duration),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      anime.titleEnglish,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      height: 20,
                      color: AppColors.thirty,
                    ),
                    SizedBox(
                        height: 20,
                        child: anime.genres.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 15,
                                    child: Icon(
                                      Icons.circle,
                                      size: 3,
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: anime.genres.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    anime.genres[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              )
                            : const Text('-')),
                    Divider(
                      height: 20,
                      color: AppColors.thirty,
                    ),
                    Text(
                      anime.rating == '' ? '-' : anime.rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      height: 30,
                      color: AppColors.thirty,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SYNOPSIS',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        anime.synopsis.isEmpty
                            ? 'No synopsis information has been provided'
                            : anime.synopsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
