import 'package:injectable/injectable.dart';
import '../entities/review_entity.dart';
import '../repositories/reviews_repository.dart';

@injectable
class SubmitReviewUseCase {
  final ReviewsRepository _repository;
  const SubmitReviewUseCase(this._repository);

  Future<void> call(ReviewEntity review) =>
      _repository.submitReview(review);
}