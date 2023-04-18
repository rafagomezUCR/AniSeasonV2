import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class SeasonalCard extends StatefulWidget {
  const SeasonalCard({super.key});

  @override
  State<SeasonalCard> createState() => _SeasonalCardState();
}

class _SeasonalCardState extends State<SeasonalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/animeInfo');
      },
      child: Card(
        child: Text("Anime Title"),
      ),
    );
  }
}
