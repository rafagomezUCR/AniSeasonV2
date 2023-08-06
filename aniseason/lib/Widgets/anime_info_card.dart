import 'package:aniseason/Styles/appcolors.dart';
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.thirty,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      anime.score == 0.0 ? 'N/A' : '$score / 10.0  MAL',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 0),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text(
                      index != anime.genres.length - 1
                          ? anime.genres[index].name + ','
                          : anime.genres[index].name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
                itemCount: anime.genres.length,
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  anime.type == 'TV' ? '${anime.type} Show' : anime.type,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
