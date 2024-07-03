part of 'center_cubit.dart';

sealed class CentersState extends Equatable {
  const CentersState();

  @override
  List<Object> get props => [];
}

final class CenterInitial extends CentersState {}

final class GetCentersLoadingState extends CentersState {}

final class GetCentersSuccessState extends CentersState {}

final class GetCentersErrorState extends CentersState {
  final String message;

  const GetCentersErrorState(this.message);
}

final class GetCenterDetailsLoadingState extends CentersState {}

final class GetCenterDetailsSuccessState extends CentersState {}

final class GetCenterDetailsErrorState extends CentersState {
  final String message;

  const GetCenterDetailsErrorState(this.message);
}

final class GetCoachesLoadingState extends CentersState {}

final class GetCoachesSuccessState extends CentersState {}

final class GetCoachesErrorState extends CentersState {
  final String message;

  const GetCoachesErrorState(this.message);
}
