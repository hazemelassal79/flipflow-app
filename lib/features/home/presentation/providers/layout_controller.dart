import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/features/centers/presentation/views/centers_view.dart';
import 'package:flipflow_app/features/home/presentation/home_view.dart';
import 'package:flipflow_app/features/profile/presentation/views/profile_view.dart';
import 'package:flipflow_app/features/workouts/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';

class LayoutController extends ChangeNotifier {
  int _currentIndex = 0;

  Widget getScreen() {
    switch (_currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        ServiceLocator.setupWorkoutsModule();
        return const WorkoutView();
      case 2:
        ServiceLocator.setupCentersModule();
        return const CentersView();
      default:
        ServiceLocator.setupProfileModule();
        return const ProfileView();
    }
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void navigateToCenters() {
    setIndex(2);
  }

  void clear() {
    _currentIndex = 0;
    notifyListeners();
  }

  int get index => _currentIndex;
}
