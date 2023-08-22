import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Provider/api_service_provider.dart';
import '../../../Styles/appcolors.dart';

Widget seasonsDropDownMenu(BuildContext context, WidgetRef ref,
    String selectedProvider, List<String> menuList, String dropdowntype) {
  List<double> customMenuItemHeights(List<String> items) {
    List<double> itemHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; ++i) {
      if (i % 2 == 0) {
        itemHeights.add(40);
      } else {
        itemHeights.add(4);
      }
    }
    return itemHeights;
  }

  List<DropdownMenuItem<String>> dividedMenuItemList(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                color: Colors.black,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  return DropdownButtonHideUnderline(
    child: DropdownButton2(
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.thirty,
      ),
      value: selectedProvider,
      iconEnabledColor: Colors.white,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.thirty,
      ),
      customItemsHeights: customMenuItemHeights(menuList),
      onChanged: (value) => {
        ref
            .read(dropdowntype == 'season'
                ? selectedSeasonProvider.notifier
                : selectedYearProvider.notifier)
            .state = value!
      },
      items: dividedMenuItemList(menuList),
    ),
  );
}
