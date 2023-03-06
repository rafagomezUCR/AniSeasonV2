import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardController extends StateNotifier<int> {
  DashBoardController(super.state);

  void setPosition(int value) {
    state = value;
  }
}
