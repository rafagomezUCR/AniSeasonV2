import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Widget scrollableCard(BuildContext context, String imageUrl) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => context.push('/animeInfo'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 150,
            width: 110,
            color: Colors.transparent,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    ],
  );
}
