import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/models/workout/workout_model.dart';
import 'package:flipflow_app/core/utils/extensions.dart';

extension WorkoutModelToWorkoutEntityMapper on WorkoutModel {
  WorkoutEntity toWorkoutEntity() {
    return WorkoutEntity(
        name: name.orEmpty(),
        minutes: minutes.orZero(),
        imageUrl: imageUrl.orEmpty(),
        exercises: exercises ?? [],
        createdAt: createdAt ?? DateTime.now(),
        numberOfExercises: numberOfExercises.orZero(),
        uid: uid.orEmpty());
  }
}
