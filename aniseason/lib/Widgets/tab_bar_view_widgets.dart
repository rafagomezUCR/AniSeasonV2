import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:flutter/material.dart';
import 'package:aniseason/Screens/schedule_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/anime_model.dart';

Widget AnimeTabBarView(BuildContext context, String day) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Consumer(
    builder: (context, ref, child) {
      final animeSchedule = ref.read(getScheduleProvider(day));
      return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        child: animeSchedule.when(
          data: (animeData) {
            List<AnimeModel> animeSeason = animeData.map((e) => e).toList();
            return GridView.builder(
              itemCount: animeData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: screenHeight * 0.3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return SeasonalCard(context, animeSeason[index].largeImageUrl);
              },
            );
          },
          error: (err, stack) {
            return Center(child: Text(err.toString() + "error2"));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      );
    },
  );
}
