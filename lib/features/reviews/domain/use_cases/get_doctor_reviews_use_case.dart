import 'package:injectable/injectable.dart';
import '../entities/review_entity.dart';
import '../repositories/reviews_repository.dart';

@injectable
class GetDoctorReviewsUseCase {
  final ReviewsRepository _repository;
  const GetDoctorReviewsUseCase(this._repository);

  Future<List<ReviewEntity>> call(String doctorId) =>
      _repository.getDoctorReviews(doctorId);
}
