import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Widget animeInfoCard(BuildContext context, String title, double score,
    int episodes, String type, String duration) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => context.push('/animeInfo'),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(score.toString() + ' / 10.0  MAL'),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(duration.toString()),
            ),
          ],
        ),
      ),
    ],
  );
}
