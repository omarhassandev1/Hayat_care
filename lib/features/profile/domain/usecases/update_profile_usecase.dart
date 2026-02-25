import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class UpdateProfileUseCase {
  final ProfileRepository repository;
  UpdateProfileUseCase({required this.repository});
  Future<void> call(UserEntity user) => repository.updateProfile(user);
}