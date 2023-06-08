import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

Widget SeasonalCard(BuildContext context, String imageUrl) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      context.push('/animeInfo');
    },
    child: Column(
      children: [
        GestureDetector(
          onTap: () => context.push('/animeInfo'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: screenHeight * 0.3,
              width: screenWidth * 0.5,
              color: Colors.red,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
