import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';

@lazySingleton
class MockProfileDataSource {
  UserEntity _profile = UserEntity(
    name: 'Harry Edward Kane',
    nationalId: '304xxx60200xxx',
    email: 'harryJane9@fcbayern.com',
    phoneNumber: '01551323700',
    gender: Gender.male,
    dateOfBirth: DateTime(1993, 07, 28),
    emergencyNumber: '01551323700',
    imageUrl:
        'https://ichef.bbci.co.uk/ace/standard/1800/cpsprodpb/8e53/live/5f993350-38f6-11ee-ba67-4973c23bf2d1.jpg',
  );

  Future<UserEntity> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _profile;
  }

  Future<void> updateProfile(UserEntity user) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _profile = user;
  }
}
