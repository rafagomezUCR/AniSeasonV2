import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Models/anime_model.dart';

Widget homepageAnimeImageCard(BuildContext context, AnimeModel anime) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => context.push('/animeInfo', extra: anime),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 150,
            width: 110,
            color: Colors.transparent,
            child: Image.network(anime.imageUrl),
          ),
        ),
      ),
    ],
  );
}
