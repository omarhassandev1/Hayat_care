import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class GetProfileUseCase {
  final ProfileRepository repository;
  GetProfileUseCase({required this.repository});
  Future<UserEntity> call() => repository.getProfile();
}