part of 'health_cubit.dart';

abstract class HealthState {}

class HealthInitial extends HealthState {}

class HealthLoading extends HealthState {}

class HealthLoaded extends HealthState {
  final List<SupportGroupEntity> supportGroups;
  HealthLoaded(this.supportGroups);
}

class JoinGroupLoading extends HealthState {}

class JoinGroupSuccess extends HealthState {}

class HealthError extends HealthState {
  final String message;
  HealthError(this.message);
}