import '../entities/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> getProfile();
  Future<void> updateProfile(UserEntity user);
}