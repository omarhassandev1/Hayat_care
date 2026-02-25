import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/mock_profile_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final MockProfileDataSource dataSource;
  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity> getProfile() => dataSource.getProfile();

  @override
  Future<void> updateProfile(UserEntity user) => dataSource.updateProfile(user);
}