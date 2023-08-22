import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Provider/api_service_provider.dart';
import '../../../Styles/appcolors.dart';

Widget seasonsSubmitButton(BuildContext context, WidgetRef ref) {
  return ElevatedButton(
    onPressed: () {
      ref.invalidate(animeSeasonProvider);
    },
    style: TextButton.styleFrom(
      backgroundColor: AppColors.thirty,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: const Text(
      'Submit',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );
}
