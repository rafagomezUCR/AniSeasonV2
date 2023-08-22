import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Styles/appcolors.dart';

Widget homepageTextField(
    BuildContext context, TextEditingController searchController) {
  return TextField(
    onSubmitted: (value) {
      context.push('/searchedAnime', extra: value);
    },
    controller: searchController,
    autocorrect: false,
    cursorColor: AppColors.ten,
    style: const TextStyle(fontSize: 20, color: Colors.white),
    decoration: InputDecoration(
      hintText: "Search for Anime...",
      hintStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: AppColors.thirty,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      suffixIcon: GestureDetector(
        child: Icon(
          Icons.search,
          color: AppColors.ten,
        ),
        onTap: () {
          if (searchController.text != '') {
            context.push('/searchedAnime', extra: searchController.value.text);
          }
        },
      ),
    ),
  );
}
