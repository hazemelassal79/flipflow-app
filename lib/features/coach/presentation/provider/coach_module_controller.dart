import 'package:flipflow_app/features/coach/presentation/views/coach_home_view.dart';
import 'package:flipflow_app/features/coach/presentation/views/coach_profile_view.dart';
import 'package:flipflow_app/features/coach/presentation/views/schedule_view.dart';
import 'package:flutter/cupertino.dart';

class CoachModuleController extends ChangeNotifier {
  final screens = [
    const CoachHomeView(),
    const CoachScheduleView(),
    const CoachProfileView(),
  ];

  int _navIndex = 0;

  int get navIndex => _navIndex;

  void changeNavIndex(int index) {
    _navIndex = index;
    notifyListeners();
  }

  void clear() {
    _navIndex = 0;
    notifyListeners();
  }
}
