import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/domain/entities/group_session_request_entity.dart';
import 'package:hayat_care/features/health/domain/entities/support_group_entity.dart';
import 'package:hayat_care/features/health/domain/use_cases/get_support_groups_use_case.dart';
import 'package:hayat_care/features/health/domain/use_cases/join_support_group_use_case.dart';

part 'health_state.dart';

@injectable
class HealthCubit extends Cubit<HealthState> {
  final GetSupportGroupsUseCase _getSupportGroupsUseCase;
  final JoinSupportGroupUseCase _joinSupportGroupUseCase;

  HealthCubit(
      this._getSupportGroupsUseCase,
      this._joinSupportGroupUseCase,
      ) : super(HealthInitial());

  Future<void> getSupportGroups() async {
    emit(HealthLoading());
    try {
      final groups = await _getSupportGroupsUseCase();
      emit(HealthLoaded(groups));
    } catch (e) {
      emit(HealthError(e.toString()));
    }
  }

  Future<void> joinSupportGroup(GroupSessionRequestEntity request) async {
    emit(JoinGroupLoading());
    try {
      await _joinSupportGroupUseCase(request);
      emit(JoinGroupSuccess());
    } catch (e) {
      emit(HealthError(e.toString()));
    }
  }
}