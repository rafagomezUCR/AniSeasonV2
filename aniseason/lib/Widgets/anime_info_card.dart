import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../Models/anime_model.dart';

Widget animeInfoCard(BuildContext context, AnimeModel anime) {
  double score = anime.score;
  int episodes = anime.episodes;
  return Column(
    children: [
      GestureDetector(
        onTap: () => context.push('/animeInfo', extra: anime),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                anime.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('$score / 10.0  MAL'),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Text(anime.genres[index].name),
                  );
                },
                itemCount: anime.genres.length,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(anime.episodes != 0
                  ? "$episodes Episodes"
                  : "Unknown Episodes"),
            ),
          ],
        ),
      ),
    ],
  );
}
