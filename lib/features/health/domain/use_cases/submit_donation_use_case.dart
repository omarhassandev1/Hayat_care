import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/domain/entities/donation_entity.dart';
import 'package:hayat_care/features/health/domain/repositories/health_repository.dart';

@injectable
class SubmitDonationUseCase {
  final HealthRepository _repository;
  SubmitDonationUseCase(this._repository);

  Future<void> call(DonationEntity donation) =>
      _repository.submitDonation(donation);
}