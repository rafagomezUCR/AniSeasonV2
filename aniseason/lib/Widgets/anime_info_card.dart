import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Widget animeInfoCard(
    BuildContext context, String title, double score, int episodes) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => context.push('/animeInfo'),
        child: Column(
          children: [
            Align(
              child: Text(title),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(score.toString()),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(episodes.toString()),
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ),
    ],
  );
}
