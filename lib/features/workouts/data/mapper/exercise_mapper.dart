import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/workouts/data/models/exercise_model.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';

extension ExerciseMapper on ExerciseModel {
  ExerciseEntity toExerciseEnity() {
    return ExerciseEntity(
      uid: uid.orEmpty(),
      name: name.orEmpty(),
      description: description.orEmpty(),
      imageUrl: imageUrl.orEmpty(),
      videoUrl: videoUrl.orEmpty(),
      minutes: minutes.orZero(),
    );
  }
}
