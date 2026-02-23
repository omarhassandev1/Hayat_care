import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:hayat_care/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_state.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = await getProfileUseCase();
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("Failed to load profile"));
    }
  }

  Future<void> updateProfile(UserEntity user) async {
    emit(ProfileUpdating(user));
    try {
      await updateProfileUseCase(user);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("Failed to update profile"));
    }
  }
}