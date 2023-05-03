import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

Widget SeasonalCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.push('/animeInfo');
    },
    child: Card(
      child: Text("season + year"),
    ),
  );
}
