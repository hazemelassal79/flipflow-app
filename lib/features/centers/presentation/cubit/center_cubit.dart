import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/domain/usecases/get_center_detils_usecase.dart';
import 'package:flipflow_app/features/centers/domain/usecases/get_centers_usecase.dart';
import 'package:flipflow_app/features/centers/domain/usecases/get_coaches_usecase.dart';

part 'center_state.dart';

class CentersCubit extends Cubit<CentersState> {
  CentersCubit(this._getCentersUseCase, this._getCenterDetailsUseCase,
      this._getCoachesUseCase)
      : super(CenterInitial());

  final GetCentersUseCase _getCentersUseCase;
  final GetCenterDetailsUseCase _getCenterDetailsUseCase;
  final GetCoachesUseCase _getCoachesUseCase;

  List<CenterEntity>? _centers;

  Future<void> getCenters([String? query]) async {
    _centers = null;
    emit(GetCentersLoadingState());
    final data = await _getCentersUseCase.execute(query.orEmpty());
    if (data.isRight()) {
      _centers = data.right;
      emit(GetCentersSuccessState());
    } else {
      emit(GetCentersErrorState(data.failure.message));
    }
  }

  List<CenterEntity>? get centersList => _centers;

  CenterEntity? _centerEntity;
  CenterEntity? get currentCenterEntity => _centerEntity;

  Future<void> getCenterDetails(String centerId) async {
    _centerEntity = null;
    emit(GetCenterDetailsLoadingState());
    final data = await _getCenterDetailsUseCase.execute(centerId);
    if (data.isRight()) {
      _centerEntity = data.right;
      emit(GetCenterDetailsSuccessState());
    } else {
      emit(GetCenterDetailsErrorState(data.failure.message));
    }
  }

  GymnasticTypeEntity? _currentGymnasticType;

  set setCurrentGymnasticType(GymnasticTypeEntity gymnasticType) {
    _currentGymnasticType = gymnasticType;
  }

  GymnasticTypeEntity? get currentGymnasticType => _currentGymnasticType;

  List<CoachEntity>? _coaches;

  CoachEntity? _currentCoach;

  CoachEntity get currentCoach => _currentCoach!;
  set setCurrentCoach(CoachEntity coach) {
    _currentCoach = coach;
  }

  Future<void> getCoachesOfGymnasticType([String? query]) async {
    _coaches = null;
    emit(GetCoachesLoadingState());
    final data = await _getCoachesUseCase.execute(GetCoachesUseCaseInput(
        query: query.orEmpty(),
        coachesIds: _currentGymnasticType?.coachesIds ?? []));
    if (data.isRight()) {
      _coaches = data.right;
      emit(GetCoachesSuccessState());
    } else {
      emit(GetCoachesErrorState(data.failure.message));
    }
  }

  List<CoachEntity>? get coachesList => _coaches;

  void clear() {
    _centers = null;
    _centerEntity = null;
    _coaches = null;
    _currentGymnasticType = null;
    emit(CenterInitial());
  }
}
