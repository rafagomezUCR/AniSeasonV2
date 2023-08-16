import 'package:aniseason/Controller/dashboard_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider =
    StateNotifierProvider<DashBoardController, int>(
  (ref) {
    return DashBoardController(0);
  },
);
