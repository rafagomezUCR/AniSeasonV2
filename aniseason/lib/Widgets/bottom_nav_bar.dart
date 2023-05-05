import 'package:aniseason/Provider/dashboard_controller_provider.dart';
import 'package:aniseason/Provider/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Styles/appcolors.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(dashboardControllerProvider);
    return Container(
      color: AppColors.thirty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          selectedIndex: index,
          backgroundColor: AppColors.thirty,
          color: AppColors.darkText,
          activeColor: AppColors.lightText,
          tabBackgroundColor: AppColors.ten,
          padding: const EdgeInsets.all(12),
          gap: 10,
          tabs: const [
            GButton(
              icon: Icons.home,
              iconSize: 30,
              text: "home",
            ),
            GButton(
              icon: Icons.ac_unit,
              iconSize: 30,
              text: "Seasons",
            ),
            GButton(
              icon: Icons.calendar_month,
              iconSize: 30,
              text: "Schedule",
            ),
          ],
          onTabChange: (value) => _onTabChange(value),
        ),
      ),
    );
  }

  void _onTabChange(int index) {
    ref.read(dashboardControllerProvider.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/seasons');
        break;
      case 2:
        context.go('/schedule');
        break;
      default:
    }
  }
}
