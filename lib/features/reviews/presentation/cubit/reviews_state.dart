import 'package:hayat_care/features/reviews/domain/entities/review_entity.dart';

abstract class ReviewsState {}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<ReviewEntity> reviews;
  ReviewsLoaded(this.reviews);
}

class ReviewsError extends ReviewsState {
  final String message;
  ReviewsError(this.message);
}

class ReviewSubmitting extends ReviewsState {}

class ReviewSubmitSuccess extends ReviewsState {}

class ReviewSubmitError extends ReviewsState {
  final String message;
  ReviewSubmitError(this.message);
}