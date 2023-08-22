import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Styles/appcolors.dart';

Widget customBackButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      context.pop();
    },
    style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      shape: MaterialStateProperty.all(const CircleBorder()),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.ten;
          } else {
            return AppColors.thirty;
          }
        },
      ),
    ),
    child: const Icon(Icons.arrow_back_ios_new),
  );
}
