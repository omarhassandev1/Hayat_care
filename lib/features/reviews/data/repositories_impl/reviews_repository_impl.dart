import 'package:injectable/injectable.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repositories/reviews_repository.dart';
import '../datasources/reviews_mock_datasource.dart';

@LazySingleton(as: ReviewsRepository)
class ReviewsRepositoryImpl implements ReviewsRepository {
  final ReviewsMockDatasource _datasource;
  const ReviewsRepositoryImpl(this._datasource);

  @override
  Future<List<ReviewEntity>> getDoctorReviews(String doctorId) =>
      _datasource.getDoctorReviews(doctorId);

  @override
  Future<void> submitReview(ReviewEntity review) =>
      _datasource.submitReview(review);
}