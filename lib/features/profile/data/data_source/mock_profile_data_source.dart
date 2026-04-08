import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';

@lazySingleton
class MockProfileDataSource {
  UserEntity _profile = UserEntity(
    name: 'Omar Hassan Abdelfattah',
    nationalId: '3044444554111',
    email: 'omarhassandev1@gmail.com',
    phoneNumber: '01551323700',
    gender: Gender.male,
    dateOfBirth: DateTime(1993, 08, 16),
    emergencyNumber: '01551323701',
    imageUrl:
        'https://instagram.fcai19-8.fna.fbcdn.net/v/t51.82787-19/656832871_18400563832178409_3797601276195216442_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fcai19-8.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2gEndPu_HTyNVloFZqp1lbzlpbYbXBWCQnK-jVDL65FkCLTmm4nRBe7y2qTJMMDvEjE&_nc_ohc=a-Cj1d_Z4y0Q7kNvwFKPqLn&_nc_gid=f6vzw9VVxaBSK_P98_Y6SA&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_Af08jpBghEjanYnVHCPhidRXhHNrFcs-1OGKr-DSY8o7Vw&oe=69DAD7F3&_nc_sid=7d3ac5',
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
