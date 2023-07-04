import 'package:aniseason/Provider/api_service_provider.dart';
import 'package:aniseason/Widgets/seasonal_card.dart';
import 'package:flutter/material.dart';
import 'package:aniseason/Screens/schedule_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../Models/anime_model.dart';

Widget AnimeTabBarView(
    BuildContext context, WidgetRef ref, String year, String sea) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  final animeSchedule = ref.watch(getSeasonProvider(Tuple2(year, sea)));
  return animeSchedule.when(data: (data) {
    List<AnimeModel> animeScheduleList = data.map((e) => e).toList();
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: GridView.builder(
        itemCount: animeScheduleList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: screenHeight * 0.3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return SeasonalCard(context, animeScheduleList[index].largeImageUrl);
        },
      ),
    );
  }, error: (error, stackTrace) {
    return Center(
      child: Text(error.toString()),
    );
  }, loading: () {
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}
