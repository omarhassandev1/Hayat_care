import 'package:hayat_care/features/reviews/domain/entities/review_entity.dart';

abstract class ReviewsRepository {
  Future<List<ReviewEntity>> getDoctorReviews(String doctorId);
  Future<void> submitReview(ReviewEntity review);
}