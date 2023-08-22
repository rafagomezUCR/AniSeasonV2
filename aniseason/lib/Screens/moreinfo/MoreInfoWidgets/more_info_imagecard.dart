import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Models/anime_model.dart';

Widget moreInfoImageCard(BuildContext context, AnimeModel anime) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => context.push('/animeInfo', extra: anime),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 300,
            width: 200,
            child: Image.network(
              anime.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ],
  );
}
