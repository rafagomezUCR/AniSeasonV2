import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Models/anime_model.dart';

Widget scheduleAnimeImageCard(BuildContext context, AnimeModel anime) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () => context.push('/animeInfo', extra: anime),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          SizedBox(
            height: screenHeight * 0.3,
            width: screenWidth * 0.5,
            child: Image.network(
              anime.largeImageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black.withOpacity(0.5),
                  height: screenHeight * 0.08,
                  child: Center(
                    child: Text(
                      anime.title,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
