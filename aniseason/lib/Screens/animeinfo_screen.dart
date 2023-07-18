import 'dart:math';

import 'package:aniseason/Styles/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../Models/anime_model.dart';

class AnimeInfo extends StatelessWidget {
  const AnimeInfo({super.key, required this.anime});

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [AppColors.ten, AppColors.thirty],
            radius: 0.8,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    Container(
                      height: screenHeight * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: AppColors.thirty),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(anime.largeImageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                      width: screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: AppColors.thirty),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightText,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            anime.titleEnglish ?? anime.titleJapanese,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 20,
                            child: ListView.separated(
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
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 75,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 5, color: AppColors.thirty),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightText,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Type',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(anime.type),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  thickness: 3,
                                  color: AppColors.thirty,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Source',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(anime.source),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  thickness: 3,
                                  color: AppColors.thirty,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Episodes',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        anime.episodes == 0
                                            ? 'Unknown'
                                            : anime.episodes.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 75,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 5, color: AppColors.thirty),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightText,
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Aired From',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(anime.aired),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 75,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 5, color: AppColors.thirty),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightText,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Year',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(anime.year.toString()),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  thickness: 3,
                                  color: AppColors.thirty,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Season',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(anime.season),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 20,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Text("S");
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 15);
                              },
                              itemCount: anime.streaming.length,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: screenWidth,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 5, color: AppColors.thirty),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightText,
                            ),
                            child: Text(
                              anime.synopsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
