import 'package:flipflow_app/features/workouts/data/models/filter_wotkouts_option.dart';
import 'package:flipflow_app/features/workouts/domain/entities/filter_workout_entity.dart';

extension FilterWorkoutsOptionMapper on FilterWorkoutsOptionEntity {
  FilterWorkoutsOption toEntity() {
    return FilterWorkoutsOption(
        isLessThan10Min: isLessThan10Min,
        isLessThan3Exersises: isLessThan3Exersises,
        query: query);
  }
}
